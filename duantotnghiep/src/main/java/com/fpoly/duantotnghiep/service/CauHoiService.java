package com.fpoly.duantotnghiep.service;

import java.util.List;

import com.fpoly.duantotnghiep.Entity.CauHoi;

public interface CauHoiService {
    List<CauHoi> findAll();

    List<CauHoi> findByKhoaHocId(int idKhoaHoc);

    CauHoi save(CauHoi cauHoi);
}
