package com.swdo.test.dao;

import java.util.ArrayList;
import java.util.HashMap;

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
	public ArrayList<ProductVO> productSelectAll_imageSearch(ArrayList<String> similarProduct); //상품 상세에서 관련된 상품군을 보여주기 위한 코드
	
	public ProductVO productSelectOne(String productId);
	
	public int likeInsert(HashMap<String, Object> map);
	
	public void likeUpdate(HashMap<String, Object> map);

	public int likeSelect(HashMap<String, Object> map); //map형태기 때문에 mybatis의 수정만으로도 다양한 데이터를 가져올 수 있음
	
	public int likeSum(String user_id);
	
	
}
