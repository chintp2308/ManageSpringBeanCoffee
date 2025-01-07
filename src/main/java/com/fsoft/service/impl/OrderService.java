package com.fsoft.service.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.io.ByteArrayOutputStream;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fsoft.converter.OrderConverter;
import com.fsoft.converter.TableOrderConverter;
import com.fsoft.dto.OrderDTO;
import com.fsoft.dto.OrderDetailsDTO;
import com.fsoft.dto.ProductDTO;
import com.fsoft.dto.TableOrderDTO;
import com.fsoft.entity.OrderDetailseEntity;
import com.fsoft.entity.OrderEntity;
import com.fsoft.entity.PaymentEntity;
import com.fsoft.entity.ProductEntity;
import com.fsoft.entity.TableOrderEntity;
import com.fsoft.entity.TableUserEntity;
import com.fsoft.repository.OrderDetailsRepository;
import com.fsoft.repository.OrderRepository;
import com.fsoft.response.CheckOrderResponse;
import com.fsoft.response.DailyRevenue;
import com.fsoft.response.OrderResponse;
import com.fsoft.response.RevenueStatistics;
import com.fsoft.service.IOrderDetailsService;
import com.fsoft.service.IOrderService;
import com.fsoft.service.IPaymentService;
import com.fsoft.service.ITableOrderService;
import com.fsoft.service.ITableUserService;
import com.fsoft.utils.Log;
import com.fsoft.utils.Utils;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

@Service
public class OrderService implements IOrderService {

	private static final Logger logger = Logger.getLogger(OrderService.class);

	@Autowired
	OrderRepository orderRepository;

	@Autowired
	IPaymentService paymentService;

	@Autowired
	ITableUserService tableUserService;

	@Autowired
	ITableOrderService TableOrderService;

	@Autowired
	IOrderDetailsService orderDetailsService;

	@Autowired
	OrderConverter orderConverter;

	@Autowired
	TableOrderConverter tableOrderConverter;

	@Override
	@Transactional
	public void putOrder(OrderResponse orderResponse) {
		// TODO Auto-generated method stub
		List<TableOrderEntity> tableOrderEntities = TableOrderService
				.findTableOrderByUserTableID(orderResponse.getUserTableID());
		if (tableOrderEntities != null && tableOrderEntities.get(0).getProduct() != null) {
			TableUserEntity tableUserEntity = tableUserService.findTableUserEntityByID(orderResponse.getUserTableID());
			PaymentEntity paymentEntity = paymentService.savePayment(orderResponse.getPaymentID());
			int totalQuantity = TableOrderService.totalQuantityByTableID(orderResponse.getUserTableID());
			BigDecimal totalPrice = TableOrderService.totalPriceProductByTableID(orderResponse.getUserTableID());

			String orderCode = Utils.generateCode();

			logger.info("orderCode : " + orderCode);
			logger.info("totalPrice : " + totalPrice);
			logger.info("totalQuantity : " + totalQuantity);

			OrderEntity orderEntity = new OrderEntity();
			orderEntity.setTableUser(tableUserEntity);
			orderEntity.setPayment(paymentEntity);
			orderEntity.setOrderStatus(1);
			orderEntity.setOrderCode(orderCode);
			orderEntity.setTotalQuantity(totalQuantity);
			orderEntity.setTotalPrice(totalPrice);
			orderEntity = orderRepository.save(orderEntity);

			logger.info("OrderEntity : " + orderEntity);
			logger.info("size : " + tableOrderEntities.size());

			for (TableOrderEntity tableOrderEntity : tableOrderEntities) {
				OrderDetailseEntity orderDetailseEntity = new OrderDetailseEntity();
				orderDetailseEntity.setOrder(orderEntity);
				orderDetailseEntity.setProduct(tableOrderEntity.getProduct());
				orderDetailseEntity.setProductName(tableOrderEntity.getProduct().getProductName());
				orderDetailseEntity.setProductPrice(tableOrderEntity.getProduct().getProductPrice());
				orderDetailseEntity.setProductQuantity(tableOrderEntity.getOrderQuantity());
				orderDetailsService.saveOrderDetails(orderDetailseEntity);

				logger.info("orderDetailseEntity : " + orderDetailseEntity);
				// TableOrderService.deleteItemOrder(tableOrderEntity.getTableOrderId());
			}
			Log.writeLog("Hoàn thành hóa đơn "+totalPrice+"đ");
		}

	}

	@Override
	public Integer getTotalItem() {
		// TODO Auto-generated method stub
		return (int) orderRepository.count();
	}

	@Override
	public List<OrderDTO> findAll(Pageable pageable) {
		// TODO Auto-generated method stub
		List<OrderDTO> orderDTOs = new ArrayList<>();
		List<OrderEntity> orderEntities = orderRepository.findAll(pageable).getContent();
		for (OrderEntity entity : orderEntities) {
			orderDTOs.add(orderConverter.toDto(entity));
		}
		return orderDTOs;
	}

	@Override
	public CheckOrderResponse checkOrder(int userTableID) {
		List<TableOrderEntity> tableOrderEntities = TableOrderService.findTableOrderByUserTableID(userTableID);
		if (tableOrderEntities != null && tableOrderEntities.get(0).getProduct() != null) {
			CheckOrderResponse checkOrderResponse = new CheckOrderResponse();
			checkOrderResponse.setTableOrder(tableOrderConverter.toListDTO(tableOrderEntities));
			int totalQuantity = TableOrderService.totalQuantityByTableID(userTableID);
			BigDecimal totalPrice = TableOrderService.totalPriceProductByTableID(userTableID);
			checkOrderResponse.setTotalProductPrice(totalPrice);
			checkOrderResponse.setTotalQuantity(totalQuantity);
			return checkOrderResponse;
		}
		return null;

	}

	@Override
	public OrderResponse getOrdersCompletedTodayStatistics() {
		LocalDate today = LocalDate.now();
		LocalDateTime startOfDay = today.atStartOfDay();
		LocalDateTime endOfDay = today.plusDays(1).atStartOfDay();

		// Chuyển đổi LocalDateTime sang Date
		Date startOfDayDate = Date.from(startOfDay.atZone(ZoneId.systemDefault()).toInstant());
		Date endOfDayDate = Date.from(endOfDay.atZone(ZoneId.systemDefault()).toInstant());

		List<OrderEntity> ordersToday = orderRepository.findByCreatedDateBetweenAndOrderStatus(startOfDayDate, // Sử
																												// dụng
																												// Date
																												// cho
																												// tham
																												// số
				endOfDayDate, // Sử dụng Date cho tham số
				1);

		long orderCount = ordersToday.size();
		BigDecimal totalPrice = ordersToday.stream().map(OrderEntity::getTotalPrice).reduce(BigDecimal.ZERO,
				BigDecimal::add);

		OrderResponse statistics = new OrderResponse();
		statistics.setOrderCount(orderCount);
		statistics.setTotalPrice(totalPrice);

		return statistics;
	}

	@Override
	public OrderResponse getProductSalesStatistics() {
		// Tính tổng sản phẩm bán ra
		long totalProductsSold = orderRepository.sumTotalQuantity();

		// Tính tổng sản phẩm bán ra hôm nay
		LocalDate today = LocalDate.now();
		LocalDateTime startOfDay = today.atStartOfDay();
		LocalDateTime endOfDay = today.plusDays(1).atStartOfDay();

		Date startOfDayDate = Date.from(startOfDay.atZone(ZoneId.systemDefault()).toInstant());
		Date endOfDayDate = Date.from(endOfDay.atZone(ZoneId.systemDefault()).toInstant());

		// Thay đổi kiểu dữ liệu từ long thành Long
		Long totalProductsSoldToday = orderRepository.sumTotalQuantityByCreatedDateBetween(startOfDayDate,
				endOfDayDate);

		// Tạo đối tượng ProductSalesStatistics và trả về
		OrderResponse statistics = new OrderResponse();
		statistics.setTotalProductsSold(totalProductsSold);
		statistics.setTotalProductsSoldToday(totalProductsSoldToday);
		return statistics;
	}

	@Override
	public List<OrderDTO> search(Pageable pageable, String search) {
		// TODO Auto-generated method stub
		return orderConverter.toListDTO(orderRepository.findByOrderCodeContainingIgnoreCase(search, pageable).getContent());
	}

	@Override
	public OrderDTO findByID(Integer id) {
		// TODO Auto-generated method stub
		return orderConverter.toDto(orderRepository.findOne(id));
	}

	@Override
	public byte[] generateInvoicePdf(Integer id) {
	    // Fetch order and order details
	    List<OrderDetailsDTO> orderDetailsDTOs = orderDetailsService.findAll(id, null);
	    OrderDTO orderDTO = orderConverter.toDto(orderRepository.findOne(id));

	    ByteArrayOutputStream baos = new ByteArrayOutputStream();
	    Document document = new Document();

	    try {
	        PdfWriter.getInstance(document, baos);
	        document.open();

	        // Add order details
	        document.add(new Paragraph("Invoice ID: " + orderDTO.getOrderCode()));
	        document.add(new Paragraph("Date: " + new java.util.Date()));
	        document.add(new Paragraph("Total Price: " + orderDTO.getTotalPrice() + "đ"));
	        document.add(new Paragraph("Total Quantity: " + orderDTO.getTotalQuantity()));
	        document.add(new Paragraph(" ")); // Add a blank line

	        // Add table headers
	        PdfPTable table = new PdfPTable(4); // 4 columns
	        table.setWidthPercentage(100);

	        PdfPCell cell;

	        cell = new PdfPCell(new Phrase("Product Name"));
	        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
	        table.addCell(cell);

	        cell = new PdfPCell(new Phrase("Price"));
	        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
	        table.addCell(cell);

	        cell = new PdfPCell(new Phrase("Quantity"));
	        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
	        table.addCell(cell);

	        cell = new PdfPCell(new Phrase("Total"));
	        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
	        table.addCell(cell);

	        // Add product details
	        for (OrderDetailsDTO details : orderDetailsDTOs) {
	            table.addCell(details.getProductName());
	            table.addCell(details.getProductPrice() + "đ");
	            table.addCell(String.valueOf(details.getProductQuantity()));

	            BigDecimal total = new BigDecimal(details.getProductPrice()).multiply(BigDecimal.valueOf(details.getProductQuantity()));
	            table.addCell(total + "đ");
	        }

	        document.add(table);

	        document.close();
	    } catch (DocumentException e) {
	        e.printStackTrace();
	    }

	    return baos.toByteArray();
	}
	
	@Override
	public List<DailyRevenue> getDailyRevenue() {
		return orderRepository.findDailyRevenue(); // Trả về List<DailyRevenue>
	}

	@Override
	public List<DailyRevenue> getDailyRevenueLast7Days() {
		LocalDate today = LocalDate.now();
		LocalDateTime startOfDayLast7Days = today.minusDays(7).atStartOfDay();
		Date startOfDayDateLast7Days = Date.from(startOfDayLast7Days.atZone(ZoneId.systemDefault()).toInstant());
		return orderRepository.findDailyRevenueLast7Days(startOfDayDateLast7Days);
	}

	@Override
	public List<DailyRevenue> getDailyRevenueLast30Days() {
		LocalDate today = LocalDate.now();
		LocalDateTime startOfDayLast30Days = today.minusDays(30).atStartOfDay();
		Date startOfDayDateLast30Days = Date.from(startOfDayLast30Days.atZone(ZoneId.systemDefault()).toInstant());
		return orderRepository.findDailyRevenueLast30Days(startOfDayDateLast30Days);
	}
	
	@Override
	public RevenueStatistics getRevenueStatistics() {
	    Date today = new Date();
	    Calendar yesterday = Calendar.getInstance();
	    yesterday.add(Calendar.DATE, -1);
	    Date yesterdayDate = yesterday.getTime();

	    List<RevenueStatistics> statistics = orderRepository.findRevenueStatistics(yesterdayDate, today);

	    // Tính toán tỉ lệ tăng trưởng doanh thu
	    if (statistics.size() == 2) {
	        BigDecimal yesterdayRevenue = statistics.get(0).getTotal_price();
	        BigDecimal todayRevenue = statistics.get(1).getTotal_price();

	        // Kiểm tra xem yesterdayRevenue có bằng 0 hay không
	        if (yesterdayRevenue.compareTo(BigDecimal.ZERO) > 0) {
	            double growthRate = ((todayRevenue.subtract(yesterdayRevenue).doubleValue() / yesterdayRevenue.doubleValue()) * 100);
	            statistics.get(1).setGrowthRate(growthRate);
	        } else {
	            // Nếu yesterdayRevenue bằng 0, set growthRate là 0
	            statistics.get(1).setGrowthRate(0.0);
	        }
	        return statistics.get(1); // Trả về dữ liệu của ngày hôm nay
	    } else if (statistics.size() == 1) {
	        return statistics.get(0); 
	    } else {
	        return new RevenueStatistics(); 
	    }
	}
}
