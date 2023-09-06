package com.fpoly.duantotnghiep.service;

import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.http.InputStreamContent;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.services.youtube.YouTube;
import com.google.api.services.youtube.model.Video;
import com.google.api.services.youtube.model.VideoSnippet;
import com.google.api.services.youtube.model.VideoStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.GeneralSecurityException;

@Service
public class YouTubeService {

    private static final String DEVELOPER_KEY = "AIzaSyD6JPuHfAqNtYvDjDOY63GrfOKYVosXtus"; // Replace with your API key
    private static final String APPLICATION_NAME = "My Spring Boot Application";

    private YouTube youTube;

    public YouTubeService() throws GeneralSecurityException, IOException {
        youTube = getYouTubeService();

    }

    public void uploadVideo(String title, String description, String privacyStatus, MultipartFile file)
            throws IOException {

        Video video = new Video();
        VideoSnippet snippet = new VideoSnippet();
        snippet.setTitle(title);
        snippet.setDescription(description);
        video.setSnippet(snippet);
        VideoStatus status = new VideoStatus();
        status.setPrivacyStatus(privacyStatus);
        video.setStatus(status);

        InputStreamContent mediaContent = new InputStreamContent("video/*",
                file.getInputStream());
        YouTube.Videos.Insert request = youTube.videos()
                .insert("snippet,status", video, mediaContent);
        try {

            request.setKey(DEVELOPER_KEY);
            Video response = request.execute();
            // Handle the YouTube API response as needed
            System.out.println("Video uploaded successfully!");
            System.out.println("Video ID: " + response.getId());
            System.out.println("Video Title: " + response.getSnippet().getTitle());
            System.out.println("Video Description: " + response.getSnippet().getDescription());
            System.out.println("Video Privacy Status: " + response.getStatus().getPrivacyStatus());
        } catch (Exception e) {
            // TODO: handle exception
            System.out.println(e.getMessage());
        }

    }

    private YouTube getYouTubeService() throws GeneralSecurityException, IOException {
        return new YouTube.Builder(
                GoogleNetHttpTransport.newTrustedTransport(),
                JacksonFactory.getDefaultInstance(),
                null)
                .setApplicationName(APPLICATION_NAME)
                .build();
    }
}
