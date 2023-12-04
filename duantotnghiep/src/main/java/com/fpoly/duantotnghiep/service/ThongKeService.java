package com.fpoly.duantotnghiep.service;

import java.util.Date;
import java.util.List;

import com.fpoly.duantotnghiep.Entity.ThongKeDATA;

public interface ThongKeService {
 List<ThongKeDATA> getRevenueDatas();

List<ThongKeDATA> getThongKeTheoThoiGian(String batDau, String ketThuc);
}
