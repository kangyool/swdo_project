package com.swdo.test.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.swdo.test.vo.ProductVO;
import com.swdo.test.vo.UserImageVO;

@Repository
public class ProductDAO {
	
	@Autowired
	private SqlSession session;
	
	public int productInsert(ProductVO product) {
		
		int cnt=0;
		
		try {
			ProductMapper mapper = session.getMapper(ProductMapper.class);
			cnt = mapper.productInsert(product);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return cnt;
	}
	
	public int productDelete(String productId) {
		int cnt = 0;
		
		try {
			ProductMapper mapper = session.getMapper(ProductMapper.class);
			cnt = mapper.productDelete(productId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cnt;
	}
	
	public int productTotalRecordsCount(String searchText) {
		
		int totalRecord = 0;
		
		try {
			ProductMapper mapper = session.getMapper(ProductMapper.class);
			totalRecord = mapper.productTotalRecordsCount(searchText);
		} catch (Exception e) {
			e.printStackTrace();
		}
			return totalRecord;
		
	}
	
	public ArrayList<ProductVO> productSelectAll(String searchText, int startRecord, int countPerPage){
		
		ArrayList<ProductVO> result = null;
		
		try {
			
			ProductMapper mapper = session.getMapper(ProductMapper.class);
			
			RowBounds rb = new RowBounds(startRecord, countPerPage); //입력받은 startRecord 등 변수를 이용해서, 실제로 범위를 생성하여 해당 범위만 select하게 해주는 객체
			
			result = mapper.productSelectAll(searchText, rb);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	public int imageInsert(UserImageVO image) {
		
		int cnt = 0;
		
		try {
			ProductMapper mapper = session.getMapper(ProductMapper.class);
			cnt = mapper.imageInsert(image);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cnt;
	}
	
	public int productTotalRecordsCount_imageSearch(ArrayList<String> similarProduct) {
		
		int totalRecord = 0;
		
		try {
			ProductMapper mapper = session.getMapper(ProductMapper.class);
			totalRecord = mapper.productTotalRecordsCount_imageSearch(similarProduct);
		} catch (Exception e) {
			e.printStackTrace();
		}
			return totalRecord;
		
	}
	
	public ArrayList<ProductVO> productSelectAll_imageSearch(ArrayList<String> similarProduct, int startRecord, int countPerPage){
		
		ArrayList<ProductVO> result = null;
		
		try {
			
			ProductMapper mapper = session.getMapper(ProductMapper.class);
			
			RowBounds rb = new RowBounds(startRecord, countPerPage); //입력받은 startRecord 등 변수를 이용해서, 실제로 범위를 생성하여 해당 범위만 select하게 해주는 객체
			
			result = mapper.productSelectAll_imageSearch(similarProduct, rb);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
		
	}
}
