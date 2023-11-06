package com.mmm.clout.pointservice.point.infrastructure.persistence.jpa;

import com.mmm.clout.pointservice.point.domain.Point;
import org.springframework.data.jpa.repository.JpaRepository;

public interface JpaPointRepository extends JpaRepository<Point, Long> {

}
