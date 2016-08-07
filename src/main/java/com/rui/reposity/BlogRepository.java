package com.rui.reposity;

import com.rui.model.BlogEntity;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by root on 16-8-7.
 */
public interface BlogRepository extends JpaRepository<BlogEntity,Integer> {
}
