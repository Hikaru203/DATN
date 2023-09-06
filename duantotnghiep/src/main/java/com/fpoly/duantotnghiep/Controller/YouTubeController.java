package com.fpoly.duantotnghiep.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.fpoly.duantotnghiep.service.YouTubeService;

@RestController
@RequestMapping("/youtube")
public class YouTubeController {

    @Autowired
    private YouTubeService youTubeService;

    @PostMapping("/uploadVideo")
    public void uploadVideo(
            @RequestParam("title") String title,
            @RequestParam("description") String description,
            @RequestParam("privacyStatus") String privacyStatus,
            @RequestParam("file") MultipartFile file
    ) {
        try {
            youTubeService.uploadVideo(title, description, privacyStatus, file);
        } catch (Exception e) {
            // Handle exceptions
        }
    }

}

