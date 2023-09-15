package com.fpoly.duantotnghiep.service;

import java.util.List;

import com.fpoly.duantotnghiep.Entity.KhoaHoc;

public interface KhoaHocService {
    List<KhoaHoc> findAll();

    KhoaHoc findById(int id);
}
