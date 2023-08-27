package com.example.jparepository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.entity.BinhLuan;

public interface BinhLuanRepository extends JpaRepository<BinhLuan, Integer> {
    // You can add custom query methods here if needed
}
