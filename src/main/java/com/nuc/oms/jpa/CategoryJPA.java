package com.nuc.oms.jpa;

import com.nuc.oms.entity.Category;

public interface CategoryJPA extends BaseJPA<Category,Integer>{
    Category findByCname(String cname);
}
