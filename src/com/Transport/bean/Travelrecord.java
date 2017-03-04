package com.Transport.bean;

import java.sql.Timestamp;

/**
 * Travelrecord entity. @author MyEclipse Persistence Tools
 */

public class Travelrecord implements java.io.Serializable {

	// Fields

	private Integer recordId;
	private Station stationByDesbusState;
	private Station stationByAboardState;
	private Bus bus;
	private Line line;
	private String macId;
	private Timestamp aboardTime;
	private Timestamp desbusTime;
	private Double busK;
	private Integer busSerialNum;

	// Constructors

	/** default constructor */
	public Travelrecord() {
	}

	/** minimal constructor */
	public Travelrecord(Station stationByAboardState, Bus bus, Line line,
			String macId, Timestamp aboardTime) {
		this.stationByAboardState = stationByAboardState;
		this.bus = bus;
		this.line = line;
		this.macId = macId;
		this.aboardTime = aboardTime;
	}

	/** full constructor */
	public Travelrecord(Station stationByDesbusState,
			Station stationByAboardState, Bus bus, Line line, String macId,
			Timestamp aboardTime, Timestamp desbusTime, Double busK,
			Integer busSerialNum) {
		this.stationByDesbusState = stationByDesbusState;
		this.stationByAboardState = stationByAboardState;
		this.bus = bus;
		this.line = line;
		this.macId = macId;
		this.aboardTime = aboardTime;
		this.desbusTime = desbusTime;
		this.busK = busK;
		this.busSerialNum = busSerialNum;
	}

	// Property accessors

	public Integer getRecordId() {
		return this.recordId;
	}

	public void setRecordId(Integer recordId) {
		this.recordId = recordId;
	}

	public Station getStationByDesbusState() {
		return this.stationByDesbusState;
	}

	public void setStationByDesbusState(Station stationByDesbusState) {
		this.stationByDesbusState = stationByDesbusState;
	}

	public Station getStationByAboardState() {
		return this.stationByAboardState;
	}

	public void setStationByAboardState(Station stationByAboardState) {
		this.stationByAboardState = stationByAboardState;
	}

	public Bus getBus() {
		return this.bus;
	}

	public void setBus(Bus bus) {
		this.bus = bus;
	}

	public Line getLine() {
		return this.line;
	}

	public void setLine(Line line) {
		this.line = line;
	}

	public String getMacId() {
		return this.macId;
	}

	public void setMacId(String macId) {
		this.macId = macId;
	}

	public Timestamp getAboardTime() {
		return this.aboardTime;
	}

	public void setAboardTime(Timestamp aboardTime) {
		this.aboardTime = aboardTime;
	}

	public Timestamp getDesbusTime() {
		return this.desbusTime;
	}

	public void setDesbusTime(Timestamp desbusTime) {
		this.desbusTime = desbusTime;
	}

	public Double getBusK() {
		return this.busK;
	}

	public void setBusK(Double busK) {
		this.busK = busK;
	}

	public Integer getBusSerialNum() {
		return this.busSerialNum;
	}

	public void setBusSerialNum(Integer busSerialNum) {
		this.busSerialNum = busSerialNum;
	}

}