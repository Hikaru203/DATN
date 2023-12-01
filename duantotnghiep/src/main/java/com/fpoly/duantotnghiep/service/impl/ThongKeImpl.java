package com.fpoly.duantotnghiep.service.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fpoly.duantotnghiep.Entity.ThongKeDATA;
import com.fpoly.duantotnghiep.jparepository.ThanhToanRepository;
import com.fpoly.duantotnghiep.service.ThongKeService;

@Service
public class ThongKeImpl implements ThongKeService {
@Autowired
ThanhToanRepository thanhToanRepository;

    @Override
    public List<ThongKeDATA> getRevenueDatas() {
        List<Object[]> result = thanhToanRepository.fetchRevenueData();
        List<ThongKeDATA> revenueDataList = new ArrayList<>();

        for (Object[] row : result) {
            ThongKeDATA revenueData = new ThongKeDATA();
            revenueData.setYear((int) row[0]);
            revenueData.setMonth((int) row[1]);
            revenueData.setTotalRevenue((BigDecimal) row[2]);

            revenueDataList.add(revenueData);
        }

        return revenueDataList;
    }
}
