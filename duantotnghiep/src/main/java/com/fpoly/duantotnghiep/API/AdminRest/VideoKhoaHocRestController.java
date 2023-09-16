package com.fpoly.duantotnghiep.API.AdminRest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fpoly.duantotnghiep.Entity.TaiLieuKhoaHoc;
import com.fpoly.duantotnghiep.Entity.VideoKhoaHoc;
import com.fpoly.duantotnghiep.service.VideoKhoaHocService;



@CrossOrigin("*")
@RestController
@RequestMapping("/rest/VideoKhoaHoc")
public class VideoKhoaHocRestController {
	  @Autowired
	    VideoKhoaHocService videoKhoaHocService;
	  @GetMapping()
	  public List<VideoKhoaHoc> getAll() {
	        return videoKhoaHocService.findAll();
	    }
	  @GetMapping("/{id}")
	    public List<VideoKhoaHoc> getByVideoKhoaHoc(@PathVariable int id) {
	        return videoKhoaHocService.findById(id);
	    }
}
