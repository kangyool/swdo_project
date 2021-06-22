package com.swdo.test.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;

import com.swdo.test.vo.ProductVO;
import com.swdo.test.vo.UserImageVO;

public interface ProductMapper {
	
	public int productInsert(ProductVO product);
	
	public int productDelete(String productId);
	
	public int productTotalRecordsCount(String searchText);
	
	public ArrayList<ProductVO> productSelectAll(String searchText, RowBounds rb);
	
	public int imageInsert(UserImageVO image);
	
	public int productTotalRecordsCount_imageSearch(ArrayList<String> similarProduct);

	public ArrayList<ProductVO> productSelectAll_imageSearch(ArrayList<String> similarProduct, RowBounds rb);
}
