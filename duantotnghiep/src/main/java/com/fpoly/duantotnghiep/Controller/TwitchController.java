package com.fpoly.duantotnghiep.Controller;

import com.fpoly.duantotnghiep.service.CookieService;
import com.fpoly.duantotnghiep.service.TwitchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpSession;

@Controller
public class TwitchController {
    @Autowired
    private TwitchService twitchService;

    @Autowired
    private CookieService cookieService; // Bổ sung tùy theo cách bạn lưu trạng thái của ứng dụng

    @GetMapping("/Twitch/Video")
    public String authenticate(Model model, HttpSession session) {
        String accessToken = (String) session.getAttribute("accessToken");

        if (accessToken == null) {
            String authorizationUrl = twitchService.getAuthorizationUrl();
            model.addAttribute("authorizationUrl", authorizationUrl);
            model.addAttribute("accessToken", accessToken);
            return "Admin/Video";
        } else {
            String authorizationUrl = twitchService.getAuthorizationUrl();
            model.addAttribute("accessToken", accessToken);
            model.addAttribute("authorizationUrl", authorizationUrl);
            return "Admin/Video";
        }
    }

    @GetMapping("/twitch/oauth2callback")
    public String oauth2callback(@RequestParam("code") String authorizationCode, HttpSession session, Model model) {
        try {
            String accessToken = twitchService.getAccessToken(authorizationCode);
            session.setAttribute("accessToken", accessToken);

            // Trong phương thức khác
            String title = (String) session.getAttribute("title");
            String description = (String) session.getAttribute("description");
            String privacyStatus = (String) session.getAttribute("privacyStatus");
            MultipartFile file = (MultipartFile) session.getAttribute("file");

            try {
                twitchService.uploadVideo(title, description, privacyStatus, file, accessToken);

                String authorizationUrl = twitchService.getAuthorizationUrl();
                model.addAttribute("accessToken", accessToken);
                model.addAttribute("authorizationUrl", authorizationUrl);
                return "Admin/Video";
            } catch (Exception e) {
                return "redirect:/Twitch/Video";
            }
        } catch (Exception e) {
            // Xử lý các ngoại lệ
            return "redirect:/Twitch/Video";
        }
    }

    @PostMapping("/twitch/uploadVideo")
    public String uploadVideo(
            @RequestParam("title") String title,
            @RequestParam("description") String description,
            @RequestParam("privacyStatus") String privacyStatus,
            @RequestParam("file") MultipartFile file,
            HttpSession session, Model model) {
        String accessToken = (String) session.getAttribute("accessToken");

        if (accessToken == null) {
            String authorizationUrl = twitchService.getAuthorizationUrl();
            model.addAttribute("authorizationUrl", authorizationUrl);

            // Lưu các giá trị vào session

            session.setAttribute("accessToken", accessToken);
            session.setAttribute("authorizationUrl", authorizationUrl);

            return "redirect:" + authorizationUrl;
        } else {
            try {
                twitchService.uploadVideo(title, description, privacyStatus, file, accessToken);
                return "Admin/Video";
            } catch (Exception e) {
                model.addAttribute("error", e.getMessage());
                return "Admin/Video";
            }
        }
    }
}
