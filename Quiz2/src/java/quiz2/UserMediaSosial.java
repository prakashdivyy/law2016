/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package quiz2;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author m.prakash
 */
@Entity
@Table(name = "user_media_sosial")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "UserMediaSosial.findAll", query = "SELECT u FROM UserMediaSosial u"),
    @NamedQuery(name = "UserMediaSosial.findByUserId", query = "SELECT u FROM UserMediaSosial u WHERE u.userMediaSosialPK.userId = :userId"),
    @NamedQuery(name = "UserMediaSosial.findByMediaSosialId", query = "SELECT u FROM UserMediaSosial u WHERE u.userMediaSosialPK.mediaSosialId = :mediaSosialId"),
    @NamedQuery(name = "UserMediaSosial.findByNama", query = "SELECT u FROM UserMediaSosial u WHERE u.nama = :nama")})
public class UserMediaSosial implements Serializable {
    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected UserMediaSosialPK userMediaSosialPK;
    @Basic(optional = false)
    @Column(name = "nama")
    private String nama;

    public UserMediaSosial() {
    }

    public UserMediaSosial(UserMediaSosialPK userMediaSosialPK) {
        this.userMediaSosialPK = userMediaSosialPK;
    }

    public UserMediaSosial(UserMediaSosialPK userMediaSosialPK, String nama) {
        this.userMediaSosialPK = userMediaSosialPK;
        this.nama = nama;
    }

    public UserMediaSosial(int userId, int mediaSosialId) {
        this.userMediaSosialPK = new UserMediaSosialPK(userId, mediaSosialId);
    }

    public UserMediaSosialPK getUserMediaSosialPK() {
        return userMediaSosialPK;
    }

    public void setUserMediaSosialPK(UserMediaSosialPK userMediaSosialPK) {
        this.userMediaSosialPK = userMediaSosialPK;
    }

    public String getNama() {
        return nama;
    }

    public void setNama(String nama) {
        this.nama = nama;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (userMediaSosialPK != null ? userMediaSosialPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof UserMediaSosial)) {
            return false;
        }
        UserMediaSosial other = (UserMediaSosial) object;
        if ((this.userMediaSosialPK == null && other.userMediaSosialPK != null) || (this.userMediaSosialPK != null && !this.userMediaSosialPK.equals(other.userMediaSosialPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "quiz2.UserMediaSosial[ userMediaSosialPK=" + userMediaSosialPK + " ]";
    }
    
}
