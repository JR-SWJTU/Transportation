package com.Transport.bean;

import java.util.HashSet;
import java.util.Set;

/**
 * Bus entity. @author MyEclipse Persistence Tools
 */

public class Bus implements java.io.Serializable {

	// Fields

	private Integer busId;
	private Integer maxLoading;
	private Set travelrecords = new HashSet(0);
	private Set routerecords = new HashSet(0);

	// Constructors

	/** default constructor */
	public Bus() {
	}

	/** minimal constructor */
	public Bus(Integer maxLoading) {
		this.maxLoading = maxLoading;
	}

	/** full constructor */
	public Bus(Integer maxLoading, Set travelrecords, Set routerecords) {
		this.maxLoading = maxLoading;
		this.travelrecords = travelrecords;
		this.routerecords = routerecords;
	}

	// Property accessors

	public Integer getBusId() {
		return this.busId;
	}

	public void setBusId(Integer busId) {
		this.busId = busId;
	}

	public Integer getMaxLoading() {
		return this.maxLoading;
	}

	public void setMaxLoading(Integer maxLoading) {
		this.maxLoading = maxLoading;
	}

	public Set getTravelrecords() {
		return this.travelrecords;
	}

	public void setTravelrecords(Set travelrecords) {
		this.travelrecords = travelrecords;
	}

	public Set getRouterecords() {
		return this.routerecords;
	}

	public void setRouterecords(Set routerecords) {
		this.routerecords = routerecords;
	}

}