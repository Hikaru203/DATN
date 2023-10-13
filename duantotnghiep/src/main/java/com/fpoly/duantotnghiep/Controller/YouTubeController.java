package com.fpoly.duantotnghiep.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.ui.Model;

import com.fpoly.duantotnghiep.service.CookieService;
import com.fpoly.duantotnghiep.service.YouTubeService;

import jakarta.servlet.http.HttpSession;

@Controller
public class YouTubeController {
    String accessToken;

    @Autowired
    private YouTubeService youTubeService;

    @Autowired
    CookieService cookieService;

    @GetMapping("/Admin/Video")
    public String authenticate(Model model, HttpSession session) {
        String accessToken = (String) session.getAttribute("accessToken");

        if (accessToken == null) {
            String authorizationUrl = youTubeService.getAuthorizationUrl();
            model.addAttribute("authorizationUrl", authorizationUrl);
            model.addAttribute("accessToken", accessToken);
            model.addAttribute("authorizationUrl", authorizationUrl);
            return "Admin/Video";

        } else {
            String authorizationUrl = youTubeService.getAuthorizationUrl();
            model.addAttribute("accessToken", accessToken);
            model.addAttribute("authorizationUrl", authorizationUrl);
            return "Admin/Video";
        }
    }

    @GetMapping("/oauth2callback")
    public String oauth2callback(@RequestParam("code") String authorizationCode, HttpSession session, Model model) {
        try {
            accessToken = youTubeService.getAccessToken(authorizationCode);
            session.setAttribute("accessToken", accessToken);

            // Trong phương thức khác
            String title = (String) session.getAttribute("title");
            String description = (String) session.getAttribute("description");
            String privacyStatus = (String) session.getAttribute("privacyStatus");
            MultipartFile file = (MultipartFile) session.getAttribute("file");

            try {
                youTubeService.uploadVideo(title, description, privacyStatus, file, accessToken);

                String authorizationUrl = youTubeService.getAuthorizationUrl();
                model.addAttribute("accessToken", accessToken);
                model.addAttribute("authorizationUrl", authorizationUrl);
                return "Admin/Video";

            } catch (Exception e) {
                return "redirect:/Admin/Video";
            }
        } catch (Exception e) {
            // Handle exceptions
            return "redirect:/Admin/Video";
        }

    }

    @PostMapping("/youtube/uploadVideo")
    public String uploadVideo(
            @RequestParam("title") String title,
            @RequestParam("description") String description,
            @RequestParam("privacyStatus") String privacyStatus,
            @RequestParam("file") MultipartFile file,
            HttpSession session, Model model) {

        if (accessToken == null) {
            String authorizationUrl = youTubeService.getAuthorizationUrl();
            model.addAttribute("authorizationUrl", authorizationUrl);

            // Lưu các giá trị vào session

            session.setAttribute("accessToken", accessToken);
            session.setAttribute("authorizationUrl", authorizationUrl);

            return "redirect:" + authorizationUrl;
        } else {
            try {
                youTubeService.uploadVideo(title, description, privacyStatus, file, accessToken);
                return "Admin/Video";
            } catch (Exception e) {
                model.addAttribute("error", e.getMessage());
                return "Admin/Video";
            }
        }
    }

}
