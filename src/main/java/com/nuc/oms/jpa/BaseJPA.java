package com.nuc.oms.jpa;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.NoRepositoryBean;

import java.io.Serializable;


/**
 * jpa基类
 * @param <T> 实体
 * @param <ID> 主键类型
 */
@NoRepositoryBean
public interface BaseJPA<T,ID extends Serializable> extends JpaRepository<T,ID>,JpaSpecificationExecutor<T>,Serializable {
}
