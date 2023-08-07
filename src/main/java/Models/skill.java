/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.util.Map;

/**
 *
 * @author medel
 */
public class skill {

    private String name;
    private String Url;
    private Integer progress;
    private Integer TimeSpent;
    private Map<String, PalierDetails> allPalierDetails;

    public Map<String, PalierDetails> getAllPalierDetails() {
        return allPalierDetails;
    }

    public void setAllPalierDetails(Map<String, PalierDetails> allPalierDetails) {
        this.allPalierDetails = allPalierDetails;
    }

    public skill(String name) {
        this.name = name;
    }

    public Integer getTimeSpent() {
        return TimeSpent;
    }

    public void setTimeSpent(Integer TimeSpent) {
        this.TimeSpent = TimeSpent;
    }

    public skill() {

    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return Url;
    }

    public void setUrl(String Url) {
        this.Url = Url;
    }

    public Integer getProgress() {
        return progress;
    }

    public void setProgress(Integer progress) {
        this.progress = progress;
    }

    public class PalierDetails {

        public PalierDetails() {
        }
        private Integer totalTrainingTrys;
        private Integer totalTestTrys;

        public Integer getTotalTrainingTrys() {
            return totalTrainingTrys;
        }

        public void setTotalTrainingTrys(Integer totalTrainingTrys) {
            this.totalTrainingTrys = totalTrainingTrys;
        }

        public Integer getTotalTestTrys() {
            return totalTestTrys;
        }

        public void setTotalTestTrys(Integer totalTestTrys) {
            this.totalTestTrys = totalTestTrys;
        }
    }

}
