package com.Transport.bean;

import java.sql.Timestamp;

/**
 * Routerecord entity. @author MyEclipse Persistence Tools
 */

public class Routerecord implements java.io.Serializable {

	// Fields

	private Integer routeId;
	private Bus bus;
	private Line line;
	private Timestamp departureTime;
	private Timestamp arrivalTime;

	// Constructors

	/** default constructor */
	public Routerecord() {
	}

	/** full constructor */
	public Routerecord(Bus bus, Line line, Timestamp departureTime,
			Timestamp arrivalTime) {
		this.bus = bus;
		this.line = line;
		this.departureTime = departureTime;
		this.arrivalTime = arrivalTime;
	}

	// Property accessors

	public Integer getRouteId() {
		return this.routeId;
	}

	public void setRouteId(Integer routeId) {
		this.routeId = routeId;
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

	public Timestamp getDepartureTime() {
		return this.departureTime;
	}

	public void setDepartureTime(Timestamp departureTime) {
		this.departureTime = departureTime;
	}

	public Timestamp getArrivalTime() {
		return this.arrivalTime;
	}

	public void setArrivalTime(Timestamp arrivalTime) {
		this.arrivalTime = arrivalTime;
	}

}