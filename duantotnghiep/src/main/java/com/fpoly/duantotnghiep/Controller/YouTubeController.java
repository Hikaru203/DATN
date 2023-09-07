package com.fpoly.duantotnghiep.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.ui.Model;
import com.fpoly.duantotnghiep.service.YouTubeService;

import jakarta.servlet.http.HttpSession;

@Controller
public class YouTubeController {
    String accessToken;

    @Autowired
    private YouTubeService youTubeService;

    @GetMapping("/Video")
    public String authenticate(Model model, HttpSession session) {
        String accessToken = (String) session.getAttribute("accessToken");

        if (accessToken == null) {
            String redirectAfterLogin = "/youtube/uploadVideo";
            String authorizationUrl = youTubeService.getAuthorizationUrl();
            model.addAttribute("authorizationUrl", authorizationUrl);
            System.out.println("authorizationUrl: " + authorizationUrl);
            return "Admin/Video";
        } else {
            return "Admin/Video";
        }
    }

    @GetMapping("/oauth2callback")
    public String oauth2callback(@RequestParam("code") String authorizationCode, HttpSession session) {
        try {
            accessToken = youTubeService.getAccessToken(authorizationCode);
            System.out.println("accessToken1: " + accessToken);
            session.setAttribute("accessToken", accessToken);
            return "Admin/Video";
        } catch (Exception e) {
            // Handle exceptions
            return "error";
        }
    }

    @PostMapping("/youtube/uploadVideo")
    @ResponseBody
    public String uploadVideo(
            @RequestParam("title") String title,
            @RequestParam("description") String description,
            @RequestParam("privacyStatus") String privacyStatus,
            @RequestParam("file") MultipartFile file,
            HttpSession session, Model model) {
        System.out.println("title: " + title);
        System.out.println("description: " + description);
        System.out.println("privacyStatus: " + privacyStatus);
        System.out.println("file: " + file);
        System.out.println("accessToken2: " + accessToken);

        if (accessToken == null) {
            String authorizationUrl = youTubeService.getAuthorizationUrl();
            model.addAttribute("authorizationUrl", authorizationUrl);
            System.out.println("authorizationUrl: " + authorizationUrl);
            return "redirect:" + authorizationUrl;
        } else {
            try {
                youTubeService.uploadVideo(title, description, privacyStatus, file, accessToken);
                return "success";
            } catch (Exception e) {
                model.addAttribute("error", e.getMessage());
                return "error" + e;
            }
        }
    }
}
