package org.powertac.visualizer.services;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map.Entry;

import org.apache.log4j.Logger;
import org.powertac.common.Broker;
import org.powertac.common.repo.DomainRepo;
import org.powertac.visualizer.domain.genco.Genco;
import org.powertac.visualizer.interfaces.TimeslotCompleteActivation;
import org.springframework.stereotype.Service;

/**
 * Takes care of gencos' data.
 * 
 * @author Jurica Babic
 * 
 */
@Service
public class GencoService implements TimeslotCompleteActivation, DomainRepo {

	private static Logger log = Logger.getLogger(GencoService.class);

	private HashMap<String, Genco> gencoMap;
	private ArrayList<Genco> gencoList;

	public GencoService() {
		recycle();
	}

	/**
	 * Creates and adds genco for the specified broker.
	 * 
	 * @param template
	 *            broker
	 * @return created broker
	 */
	public Genco addGenco(Broker broker) {
		Genco genco = new Genco(broker);

		gencoMap.put(genco.getBroker().getUsername(), genco);
		// rebuild list:
		gencoList = new ArrayList<Genco>(gencoMap.values());
		log.info(genco.toString() + " added.");
		return genco;
	}

	/**
	 * Returns null if genco cannot be found.
	 * 
	 * @param username
	 * @return
	 */
	public Genco findGencoByUsername(String username) {

		return gencoMap.get(username);

	}

	@SuppressWarnings("unchecked")
	public List<Genco> getGencoList() {
		return (List<Genco>) gencoList.clone();
	}

	public void activate(int timeslotIndex) {
		for (Iterator iterator = gencoList.iterator(); iterator.hasNext();) {
			Genco genco = (Genco) iterator.next();
			genco.update(timeslotIndex);

		}

	}

	public void recycle() {
		gencoMap = new HashMap<String, Genco>();
		gencoList = new ArrayList<Genco>();
	}

}
