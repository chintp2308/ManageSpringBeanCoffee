package com.fsoft.api.user;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fsoft.api.admin.TableUserAPI;
import com.fsoft.dto.BaseDTO;
import com.fsoft.dto.CategoryDTO;
import com.fsoft.dto.ProductDTO;
import com.fsoft.dto.TableOrderDTO;
import com.fsoft.dto.TableUserDTO;
import com.fsoft.entity.TableOrderEntity;
import com.fsoft.response.CheckOrderResponse;
import com.fsoft.response.OrderResponse;
import com.fsoft.response.ResponseAPI;
import com.fsoft.response.TableOrderResponse;
import com.fsoft.service.ICategoryService;
import com.fsoft.service.IOrderService;
import com.fsoft.service.IProductService;
import com.fsoft.service.ITableOrderService;
import com.fsoft.service.ITableUserService;


@RestController
@RequestMapping("/api/home")
public class HomeAPI {
	
	private static final Logger logger = Logger.getLogger(HomeAPI.class);
	
	
	@Autowired
	ITableUserService tableUserService;
	
	@Autowired
	ICategoryService categoryService;
	
	@Autowired
	IProductService productService;
	
	@Autowired
	ITableOrderService tableOrderService;
	
	@Autowired
	IOrderService orderService;
	
	
 	
 	@PostMapping("/check-order")
 	public ResponseAPI<?> checkOrder(@RequestBody OrderResponse orderResponse) {
		 try { 
 	    
// 	    	logger.info(orderResponse.getUserTableID());
 	    	CheckOrderResponse checkOrderResponse = orderService.checkOrder(orderResponse.getUserTableID());
 	    	
 	        return new ResponseAPI<>(HttpStatus.OK.value(), "Thành Công !", checkOrderResponse);
 	   } catch (Exception e) {
 	    	  return new ResponseAPI<>(HttpStatus.INTERNAL_SERVER_ERROR.value(), "Có Lỗi Bên Trong Server !", null);
 	    } 
 	}

	
 	@PutMapping("/put-order")
 	public ResponseAPI<?> putOrder(@RequestBody OrderResponse orderResponse) {
		 try { 
 	    
 	    	logger.info(orderResponse.getUserTableID());
 	    	orderService.putOrder(orderResponse);
 	    	
 	        return new ResponseAPI<>(HttpStatus.OK.value(), "Thành Công !", null);
 	   } catch (Exception e) {
 	    	  return new ResponseAPI<>(HttpStatus.INTERNAL_SERVER_ERROR.value(), "Có Lỗi Bên Trong Server !", null);
 	    } 
 	}
	
 	@PutMapping("/put-quantity-item-order")
 	public ResponseAPI<?> putQantityItemOrder(@RequestBody TableOrderResponse tableOrderResponse) {
 	    try {
 	    	tableOrderService.updateQantityItemOrder(tableOrderResponse);
 	        return new ResponseAPI<>(HttpStatus.OK.value(), "Cập Nhật Số Lượng Thành Công !", null);
 	   } catch (Exception e) {
 	    	  return new ResponseAPI<>(HttpStatus.INTERNAL_SERVER_ERROR.value(), "Có Lỗi Bên Trong Server !", null);
 	    } 
 	}
	
 	@DeleteMapping("/delete-item-order")
 	public ResponseAPI<?> deleteItemOrder(@RequestBody TableOrderResponse tableOrderResponse) {
 	    try {
 	    	tableOrderService.deleteItemOrder(tableOrderResponse.getTableOrderId());
 	        return new ResponseAPI<>(HttpStatus.OK.value(), "Đã Xóa Thành Công !", null);
 	   } catch (Exception e) {
 	    	  return new ResponseAPI<>(HttpStatus.INTERNAL_SERVER_ERROR.value(), "Có Lỗi Bên Trong Server !", null);
 	    } 
 	}
	
	
 	@PostMapping("/delete-table-user")
 	public ResponseAPI<?> deleteTableUser(@RequestBody TableOrderResponse tableOrderResponse) {
 	    try {
 	    	logger.info(tableOrderResponse.getUserTableID());
 	    	tableOrderService.deleteTable(tableOrderResponse.getUserTableID());
 	        return new ResponseAPI<>(HttpStatus.OK.value(), "Đã Xóa Thành Công !", null);
 	   } catch (Exception e) {
 	    	  return new ResponseAPI<>(HttpStatus.INTERNAL_SERVER_ERROR.value(), "Có Lỗi Bên Trong Server !", null);
 	    } 
 	}
 	
 	
	
 	@GetMapping("/init-data-header-table-order")
 	public ResponseAPI<?> initDataHeaderTableOrder() {
 	    try {
 	     
 	    	List<TableUserDTO> tableUserDTOs = tableUserService.getListTableActive();
 	        return new ResponseAPI<>(HttpStatus.OK.value(), "Thành Công !", tableUserDTOs);
 	   } catch (Exception e) {
 	    	  return new ResponseAPI<>(HttpStatus.INTERNAL_SERVER_ERROR.value(), "Có Lỗi Bên Trong Server !", null);
 	    } 
 	}
 	
 	@GetMapping("/init-data-table-order")
 	public ResponseAPI<List<TableOrderDTO>> initDataTableOrder() {
 	    try {
 	     
 	    	List<TableOrderDTO> tableOrderDTOs = tableOrderService.findAll();
 	        return new ResponseAPI<>(HttpStatus.OK.value(), "Thành Công !", tableOrderDTOs);
 	   } catch (Exception e) {
 	    	  return new ResponseAPI<>(HttpStatus.INTERNAL_SERVER_ERROR.value(), "Có Lỗi Bên Trong Server !", null);
 	    } 
 	}
	
 	@GetMapping("/load-category")
 	public ResponseAPI<List<CategoryDTO>> loadCategory() {
 	    try {
 	     
 	    	List<CategoryDTO> categoryDTOs = categoryService.findAll();
 	    	
 	        return new ResponseAPI<>(HttpStatus.OK.value(), "Thành Công !", categoryDTOs);
 	    } catch (Exception e) {
 	    	  return new ResponseAPI<>(HttpStatus.INTERNAL_SERVER_ERROR.value(), "Có Lỗi Bên Trong Server Huhu ! - "+e.getMessage(), null);
 	    }
 	}
 	
    @PutMapping("/put-order-table")
    public ResponseAPI<List<TableOrderDTO>> handleTableOrder(@RequestBody TableOrderResponse tableOrderResponse) {
      
        
        try {
    	     
        	List<TableOrderDTO> tableOrderDTOs = tableUserService.handleTableOrder(tableOrderResponse);
 	    	
 	        return new ResponseAPI<>(HttpStatus.OK.value(), "Thành Công !", tableOrderDTOs);
 	    } catch (Exception e) {
 	    	  return new ResponseAPI<>(HttpStatus.INTERNAL_SERVER_ERROR.value(), "Có Lỗi Bên Trong Server !", null);
 	    }
    }
 	
 	
 	@GetMapping("/data-product")
 	public ResponseEntity<ResponseAPI<BaseDTO<ProductDTO>>> getDataProduct(
 			@RequestParam(name = "page", defaultValue = "1") int page,
            @RequestParam(name = "limit", defaultValue = "10") int limit,
            @RequestParam(name = "idcategory", defaultValue = "") List<Integer> idcategory ,
            @RequestParam(name = "search", defaultValue = "") String keysearch) {
 	    try {
 	    	
 	    	 logger.info("Categories: " + idcategory);
 	        logger.info("Keysearch: " + keysearch);
 	
 	        BaseDTO<ProductDTO> baseDTO = new BaseDTO<>();

 	        baseDTO.setPage(page);
 	        baseDTO.setLimit(limit);
 	        baseDTO.setTotalItem(productService.getTotalItem(idcategory,keysearch));
 	        baseDTO.setTotalPage((int) Math.ceil((double) baseDTO.getTotalItem() / baseDTO.getLimit()));
 		    Pageable pageable = new PageRequest(page - 1, limit);
 		
 	        baseDTO.setListResult(productService.findAllByCategoryIdsAndKeysearch(idcategory,keysearch,pageable));

 	        // Trả về ResponseEntity với mã trạng thái OK (200) và dữ liệu
 	        return ResponseEntity.ok(new ResponseAPI<>(HttpStatus.OK.value(), "Thành Công !", baseDTO));
 	    } catch (Exception e) {
 	        // Xử lý lỗi chung
 	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
 	                             .body(new ResponseAPI<>(HttpStatus.INTERNAL_SERVER_ERROR.value(), "Lỗi máy chủ", null));
 	    }
 	}
	
 	@GetMapping("/table-user-group")
 	public ResponseAPI<List<String>> getDataTableUserGroup() {
 	    try {
 	     
 	    	List<String> list= tableUserService.getListTableUserGroup();
 	        return new ResponseAPI<>(HttpStatus.OK.value(), "Thành Công !", list);
 	    } catch (Exception e) {
 	    	  return new ResponseAPI<>(HttpStatus.INTERNAL_SERVER_ERROR.value(), "Có Lỗi Bên Trong Server !", null);
 	    }
 	}
 	
 	@GetMapping("/data-table-user")
 	public ResponseEntity<ResponseAPI<BaseDTO<TableUserDTO>>> getData(
 			@RequestParam(name = "page", defaultValue = "1") int page,
            @RequestParam(name = "limit", defaultValue = "10") int limit,
            @RequestParam(name = "tableUserGroup", defaultValue = "All") String tableUserGroup,
            @RequestParam(name = "tableUserStatus", defaultValue = "2") int tableUserStatus) {
 	    try {
 	     
 	    	
 	    	
 	        BaseDTO<TableUserDTO> baseDTO = new BaseDTO<>();

 	        baseDTO.setPage(page);
 	        baseDTO.setLimit(limit);
 	        baseDTO.setTotalItem(tableUserService.getTotalItem(tableUserGroup,tableUserStatus));
 	        baseDTO.setTotalPage((int) Math.ceil((double) baseDTO.getTotalItem() / baseDTO.getLimit()));
 		    Pageable pageable = new PageRequest(page - 1, limit);
 		
 	        baseDTO.setListResult(tableUserService.findAll(pageable, tableUserGroup, tableUserStatus));

 	        // Trả về ResponseEntity với mã trạng thái OK (200) và dữ liệu
 	        return ResponseEntity.ok(new ResponseAPI<>(HttpStatus.OK.value(), "Thành Công !", baseDTO));
 	    } catch (Exception e) {
 	        // Xử lý lỗi chung
 	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
 	                             .body(new ResponseAPI<>(HttpStatus.INTERNAL_SERVER_ERROR.value(), "Lỗi máy chủ", null));
 	    }
 	}
	
 	@GetMapping("/update-status-table")
 	public ResponseEntity<ResponseAPI<?>> updateStatusTable(
 			@RequestParam(name = "userTableID") int userTableID,
            @RequestParam(name = "tableUserStatus") int tableUserStatus) {
 	    try {
 	     
 	    	tableUserService.updateStatus(userTableID,tableUserStatus);
 	        return ResponseEntity.ok(new ResponseAPI<>(HttpStatus.OK.value(), "Thành Công !", null));
 	    } catch (Exception e) {
 	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
 	                             .body(new ResponseAPI<>(HttpStatus.INTERNAL_SERVER_ERROR.value(), "Lỗi máy chủ", null));
 	    }
 	}
	
}
