package com.swdo.test.vo;

import lombok.Data;

@Data
public class ProductVO {
	
   private String projectId;
   private String computeRegion;
   private String productSetId;
   private String productSetDisplayName;
    
   private String productId;
   private String productDisplayName;
   private String productCategory;
    
   private String productLabels;
    
   private String referenceImageId;
   private String gcsUri;
    
   private String uri;
}
