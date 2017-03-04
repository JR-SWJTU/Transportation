package com.Transport.bean;

/**
 * Stationofline entity. @author MyEclipse Persistence Tools
 */

public class Stationofline implements java.io.Serializable {

	// Fields

	private Integer solid;
	private Station station;
	private Line line;

	// Constructors

	/** default constructor */
	public Stationofline() {
	}

	/** full constructor */
	public Stationofline(Station station, Line line) {
		this.station = station;
		this.line = line;
	}

	// Property accessors

	public Integer getSolid() {
		return this.solid;
	}

	public void setSolid(Integer solid) {
		this.solid = solid;
	}

	public Station getStation() {
		return this.station;
	}

	public void setStation(Station station) {
		this.station = station;
	}

	public Line getLine() {
		return this.line;
	}

	public void setLine(Line line) {
		this.line = line;
	}

}