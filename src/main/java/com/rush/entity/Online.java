package com.rush.entity;

import java.io.Serializable;

/**
 * online
 * @author 
 */
public class Online implements Serializable {
    private Integer onlineId;

    private String onlineTitle;

    private String onlineInputDescript;

    private String onlineOutputDescript;

    private String onlineInputExample;

    private String onlineOutputExample;

    private String onlineSparea;

    private String onlineSpareb;

    private String onlineSparec;

    private String onlineSpared;

    private static final long serialVersionUID = 1L;

    public Integer getOnlineId() {
        return onlineId;
    }

    public void setOnlineId(Integer onlineId) {
        this.onlineId = onlineId;
    }

    public String getOnlineTitle() {
        return onlineTitle;
    }

    public void setOnlineTitle(String onlineTitle) {
        this.onlineTitle = onlineTitle;
    }

    public String getOnlineInputDescript() {
        return onlineInputDescript;
    }

    public void setOnlineInputDescript(String onlineInputDescript) {
        this.onlineInputDescript = onlineInputDescript;
    }

    public String getOnlineOutputDescript() {
        return onlineOutputDescript;
    }

    public void setOnlineOutputDescript(String onlineOutputDescript) {
        this.onlineOutputDescript = onlineOutputDescript;
    }

    public String getOnlineInputExample() {
        return onlineInputExample;
    }

    public void setOnlineInputExample(String onlineInputExample) {
        this.onlineInputExample = onlineInputExample;
    }

    public String getOnlineOutputExample() {
        return onlineOutputExample;
    }

    public void setOnlineOutputExample(String onlineOutputExample) {
        this.onlineOutputExample = onlineOutputExample;
    }

    public String getOnlineSparea() {
        return onlineSparea;
    }

    public void setOnlineSparea(String onlineSparea) {
        this.onlineSparea = onlineSparea;
    }

    public String getOnlineSpareb() {
        return onlineSpareb;
    }

    public void setOnlineSpareb(String onlineSpareb) {
        this.onlineSpareb = onlineSpareb;
    }

    public String getOnlineSparec() {
        return onlineSparec;
    }

    public void setOnlineSparec(String onlineSparec) {
        this.onlineSparec = onlineSparec;
    }

    public String getOnlineSpared() {
        return onlineSpared;
    }

    public void setOnlineSpared(String onlineSpared) {
        this.onlineSpared = onlineSpared;
    }

    @Override
    public boolean equals(Object that) {
        if (this == that) {
            return true;
        }
        if (that == null) {
            return false;
        }
        if (getClass() != that.getClass()) {
            return false;
        }
        Online other = (Online) that;
        return (this.getOnlineId() == null ? other.getOnlineId() == null : this.getOnlineId().equals(other.getOnlineId()))
            && (this.getOnlineTitle() == null ? other.getOnlineTitle() == null : this.getOnlineTitle().equals(other.getOnlineTitle()))
            && (this.getOnlineInputDescript() == null ? other.getOnlineInputDescript() == null : this.getOnlineInputDescript().equals(other.getOnlineInputDescript()))
            && (this.getOnlineOutputDescript() == null ? other.getOnlineOutputDescript() == null : this.getOnlineOutputDescript().equals(other.getOnlineOutputDescript()))
            && (this.getOnlineInputExample() == null ? other.getOnlineInputExample() == null : this.getOnlineInputExample().equals(other.getOnlineInputExample()))
            && (this.getOnlineOutputExample() == null ? other.getOnlineOutputExample() == null : this.getOnlineOutputExample().equals(other.getOnlineOutputExample()))
            && (this.getOnlineSparea() == null ? other.getOnlineSparea() == null : this.getOnlineSparea().equals(other.getOnlineSparea()))
            && (this.getOnlineSpareb() == null ? other.getOnlineSpareb() == null : this.getOnlineSpareb().equals(other.getOnlineSpareb()))
            && (this.getOnlineSparec() == null ? other.getOnlineSparec() == null : this.getOnlineSparec().equals(other.getOnlineSparec()))
            && (this.getOnlineSpared() == null ? other.getOnlineSpared() == null : this.getOnlineSpared().equals(other.getOnlineSpared()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getOnlineId() == null) ? 0 : getOnlineId().hashCode());
        result = prime * result + ((getOnlineTitle() == null) ? 0 : getOnlineTitle().hashCode());
        result = prime * result + ((getOnlineInputDescript() == null) ? 0 : getOnlineInputDescript().hashCode());
        result = prime * result + ((getOnlineOutputDescript() == null) ? 0 : getOnlineOutputDescript().hashCode());
        result = prime * result + ((getOnlineInputExample() == null) ? 0 : getOnlineInputExample().hashCode());
        result = prime * result + ((getOnlineOutputExample() == null) ? 0 : getOnlineOutputExample().hashCode());
        result = prime * result + ((getOnlineSparea() == null) ? 0 : getOnlineSparea().hashCode());
        result = prime * result + ((getOnlineSpareb() == null) ? 0 : getOnlineSpareb().hashCode());
        result = prime * result + ((getOnlineSparec() == null) ? 0 : getOnlineSparec().hashCode());
        result = prime * result + ((getOnlineSpared() == null) ? 0 : getOnlineSpared().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", onlineId=").append(onlineId);
        sb.append(", onlineTitle=").append(onlineTitle);
        sb.append(", onlineInputDescript=").append(onlineInputDescript);
        sb.append(", onlineOutputDescript=").append(onlineOutputDescript);
        sb.append(", onlineInputExample=").append(onlineInputExample);
        sb.append(", onlineOutputExample=").append(onlineOutputExample);
        sb.append(", onlineSparea=").append(onlineSparea);
        sb.append(", onlineSpareb=").append(onlineSpareb);
        sb.append(", onlineSparec=").append(onlineSparec);
        sb.append(", onlineSpared=").append(onlineSpared);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}