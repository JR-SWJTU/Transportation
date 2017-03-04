package com.Transport.bean;

import java.util.HashSet;
import java.util.Set;

/**
 * Line entity. @author MyEclipse Persistence Tools
 */

public class Line implements java.io.Serializable {

	// Fields

	private Integer lineId;
	private Integer lineStartPonId;
	private Integer lineDesPonId;
	private Integer lineLength;
	private Set travelrecords = new HashSet(0);
	private Set stationoflines = new HashSet(0);
	private Set routerecords = new HashSet(0);

	// Constructors

	/** default constructor */
	public Line() {
	}

	/** minimal constructor */
	public Line(Integer lineStartPonId, Integer lineDesPonId, Integer lineLength) {
		this.lineStartPonId = lineStartPonId;
		this.lineDesPonId = lineDesPonId;
		this.lineLength = lineLength;
	}

	/** full constructor */
	public Line(Integer lineStartPonId, Integer lineDesPonId,
			Integer lineLength, Set travelrecords, Set stationoflines,
			Set routerecords) {
		this.lineStartPonId = lineStartPonId;
		this.lineDesPonId = lineDesPonId;
		this.lineLength = lineLength;
		this.travelrecords = travelrecords;
		this.stationoflines = stationoflines;
		this.routerecords = routerecords;
	}

	// Property accessors

	public Integer getLineId() {
		return this.lineId;
	}

	public void setLineId(Integer lineId) {
		this.lineId = lineId;
	}

	public Integer getLineStartPonId() {
		return this.lineStartPonId;
	}

	public void setLineStartPonId(Integer lineStartPonId) {
		this.lineStartPonId = lineStartPonId;
	}

	public Integer getLineDesPonId() {
		return this.lineDesPonId;
	}

	public void setLineDesPonId(Integer lineDesPonId) {
		this.lineDesPonId = lineDesPonId;
	}

	public Integer getLineLength() {
		return this.lineLength;
	}

	public void setLineLength(Integer lineLength) {
		this.lineLength = lineLength;
	}

	public Set getTravelrecords() {
		return this.travelrecords;
	}

	public void setTravelrecords(Set travelrecords) {
		this.travelrecords = travelrecords;
	}

	public Set getStationoflines() {
		return this.stationoflines;
	}

	public void setStationoflines(Set stationoflines) {
		this.stationoflines = stationoflines;
	}

	public Set getRouterecords() {
		return this.routerecords;
	}

	public void setRouterecords(Set routerecords) {
		this.routerecords = routerecords;
	}

}