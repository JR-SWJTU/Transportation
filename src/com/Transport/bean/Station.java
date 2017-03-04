package com.Transport.bean;

import java.util.HashSet;
import java.util.Set;

/**
 * Station entity. @author MyEclipse Persistence Tools
 */

public class Station implements java.io.Serializable {

	// Fields

	private Integer stationId;
	private String stationName;
	private Double stationLng;
	private Double stationLat;
	private Set travelrecordsForAboardState = new HashSet(0);
	private Set travelrecordsForDesbusState = new HashSet(0);
	private Set stationoflines = new HashSet(0);

	// Constructors

	/** default constructor */
	public Station() {
	}

	/** minimal constructor */
	public Station(String stationName, Double stationLng, Double stationLat) {
		this.stationName = stationName;
		this.stationLng = stationLng;
		this.stationLat = stationLat;
	}

	/** full constructor */
	public Station(String stationName, Double stationLng, Double stationLat,
			Set travelrecordsForAboardState, Set travelrecordsForDesbusState,
			Set stationoflines) {
		this.stationName = stationName;
		this.stationLng = stationLng;
		this.stationLat = stationLat;
		this.travelrecordsForAboardState = travelrecordsForAboardState;
		this.travelrecordsForDesbusState = travelrecordsForDesbusState;
		this.stationoflines = stationoflines;
	}

	// Property accessors

	public Integer getStationId() {
		return this.stationId;
	}

	public void setStationId(Integer stationId) {
		this.stationId = stationId;
	}

	public String getStationName() {
		return this.stationName;
	}

	public void setStationName(String stationName) {
		this.stationName = stationName;
	}

	public Double getStationLng() {
		return this.stationLng;
	}

	public void setStationLng(Double stationLng) {
		this.stationLng = stationLng;
	}

	public Double getStationLat() {
		return this.stationLat;
	}

	public void setStationLat(Double stationLat) {
		this.stationLat = stationLat;
	}

	public Set getTravelrecordsForAboardState() {
		return this.travelrecordsForAboardState;
	}

	public void setTravelrecordsForAboardState(Set travelrecordsForAboardState) {
		this.travelrecordsForAboardState = travelrecordsForAboardState;
	}

	public Set getTravelrecordsForDesbusState() {
		return this.travelrecordsForDesbusState;
	}

	public void setTravelrecordsForDesbusState(Set travelrecordsForDesbusState) {
		this.travelrecordsForDesbusState = travelrecordsForDesbusState;
	}

	public Set getStationoflines() {
		return this.stationoflines;
	}

	public void setStationoflines(Set stationoflines) {
		this.stationoflines = stationoflines;
	}

}