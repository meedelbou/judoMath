/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.util.List;

/**
 *
 * author medel
 */
public class Exercise {
    private String content;
    private List<String> options;
    private String answer;
    private Boolean prompt = false;
    private Boolean timer = false;
    private Boolean TF = false;
    private List<Boolean> optionsTF;
    private List<Integer> limitesEncad ;

    public List<Integer> getLimitesEncad() {
        return limitesEncad;
    }

    public void setLimitesEncad(List<Integer> limitesEncad) {
        this.limitesEncad = limitesEncad;
    }

    public Boolean getTF() {
        return TF;
    }

    public void setTF(Boolean TF) {
        this.TF = TF;
    }

    public List<Boolean> getOptionsTF() {
        return optionsTF;
    }

    public void setOptionsTF(List<Boolean> optionsTF) {
        this.optionsTF = optionsTF;
    }

    public Boolean getTimer() {
        return timer;
    }

    public void setTimer(Boolean timer) {
        this.timer = timer;
    }

    public Boolean getPrompt() {
        return prompt;
    }

    public void setPrompt(Boolean prompt) {
        this.prompt = prompt;
    }

    public Exercise(String content, List<String> options, String answer) {
        this.content = content;
        this.options = options;
        this.answer = answer;
    }

    public Exercise() {
    }
    
    public String getContent() {
        return content;
    }

    public List<String> getOptions() {
        return options;
    }

    public String getAnswer() {
        return answer;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setOptions(List<String> options) {
        this.options = options;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public boolean checkResult(String selectedOption) {
        return selectedOption == answer;
    }
}
