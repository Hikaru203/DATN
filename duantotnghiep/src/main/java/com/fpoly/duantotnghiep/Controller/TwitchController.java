package com.fpoly.duantotnghiep.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.fpoly.duantotnghiep.service.CookieService;
import com.fpoly.duantotnghiep.service.TwitchAuthService; // Import TwitchAuthService
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Controller
public class TwitchController {
    String accessToken;

    @Autowired
    private TwitchAuthService twitchAuthService;

    @Autowired
    private CookieService cookieService;

    @RequestMapping(value = "/auth-twitch", method = RequestMethod.GET)
    public String authenticateTwitch() {
        String authURL = twitchAuthService.generateAuthURL();
        return "redirect:" + authURL;
    }

    @RequestMapping(value = "/oauth2callback", method = RequestMethod.GET)
    public String twitchCallback(@RequestParam(name = "code") String authCode) {
        String accessToken1 = cookieService.getValue("accessToken");
        try {
            String response = twitchAuthService.getAccessToken(authCode);

            // Lưu accessToken1 vào cookie hoặc thực hiện các hành động khác
            cookieService.add("accessToken", response, 1);

            // Sau khi nhận được accessToken1, bạn có thể chuyển hướng người dùng đến trang
            // khác hoặc thực hiện các hành động khác.
            return "redirect:/test"; // Ví dụ chuyển hướng đến trang chào mừng
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/error";
        }

    }

    @GetMapping("/test")
    public String testPage() {
        // Điều này sẽ chuyển hướng đến trang HTML ở '/static/test.html'
        return "Admin/test";
    }

    @PostMapping("/upload-video")
    public String uploadVideo(@RequestParam("file") MultipartFile file) {
        accessToken = cookieService.getValue("accessToken");
        if (accessToken != null && !accessToken.isEmpty()) {
            try {
                twitchAuthService.uploadVideo(file, accessToken, twitchAuthService.getBroadcasterId());
                return "redirect:/success";
            } catch (Exception e) {
                // Xử lý lỗi khi không thể upload video
                e.printStackTrace(); // In thông báo lỗi vào console
                return "redirect:/error";
            }
        } else {
            return "redirect:/error";
        }
    }
}
