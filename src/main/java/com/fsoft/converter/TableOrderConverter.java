package com.fsoft.converter;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Component;

import com.fsoft.dto.TableOrderDTO;
import com.fsoft.entity.TableOrderEntity;

@Component
public class TableOrderConverter {
	
	private final ModelMapper modelMapper = new ModelMapper();

	private static final Logger logger = Logger.getLogger(TableOrderConverter.class);

	public TableOrderDTO toDto(TableOrderEntity entity) {
		if (entity != null) {
			return modelMapper.map(entity, TableOrderDTO.class);
		} else {
			return null;
		}
	}

	public TableOrderEntity toEntity(TableOrderDTO dto) {
		if (dto != null) {
			return modelMapper.map(dto, TableOrderEntity.class);
		} else {
			return null;
		}
	}
	
	
	public List<TableOrderDTO> toListDTO(List<TableOrderEntity> entities) {
		// TODO Auto-generated method stub
		List<TableOrderDTO> DTOs  = new ArrayList<>();
		for (TableOrderEntity entity : entities) {
			DTOs.add(toDto(entity));
		}
		return DTOs;
	}
	
	public List<TableOrderEntity> toListEntity(List<TableOrderDTO> DTOs) {
		// TODO Auto-generated  entities stub
		List<TableOrderEntity>  entities = new ArrayList<>();
		for (TableOrderDTO dto : DTOs) {
			entities.add(toEntity(dto));
		}
		return entities;
	}
}
