package com.kcc.pms.domain.common.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.io.Serializable;

@Data
@AllArgsConstructor
public class CommonCodeSelectList implements Serializable {
    private String codeDetailNo;
    private String codeDetailName;
}
