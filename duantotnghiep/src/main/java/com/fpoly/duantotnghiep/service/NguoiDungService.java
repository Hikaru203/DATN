package com.fpoly.duantotnghiep.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.fpoly.duantotnghiep.Entity.NguoiDung;
import com.fpoly.duantotnghiep.jparepository.NguoiDungRepository;


public interface NguoiDungService {

List<NguoiDung> findAll();

List<NguoiDung> findById(int id);

}
