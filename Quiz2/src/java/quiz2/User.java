/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package quiz2;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author m.prakash
 */
@Entity
@Table(name = "user")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "User.findAll", query = "SELECT u FROM User u"),
    @NamedQuery(name = "User.findById", query = "SELECT u FROM User u WHERE u.id = :id"),
    @NamedQuery(name = "User.findByNama", query = "SELECT u FROM User u WHERE u.nama = :nama"),
    @NamedQuery(name = "User.findByTelepon", query = "SELECT u FROM User u WHERE u.telepon = :telepon"),
    @NamedQuery(name = "User.findByEmail", query = "SELECT u FROM User u WHERE u.email = :email"),
    @NamedQuery(name = "User.findByAlamat", query = "SELECT u FROM User u WHERE u.alamat = :alamat"),
    @NamedQuery(name = "User.findByKota", query = "SELECT u FROM User u WHERE u.kota = :kota"),
    @NamedQuery(name = "User.findByProvinsi", query = "SELECT u FROM User u WHERE u.provinsi = :provinsi"),
    @NamedQuery(name = "User.findByKodepos", query = "SELECT u FROM User u WHERE u.kodepos = :kodepos"),
    @NamedQuery(name = "User.findByNegara", query = "SELECT u FROM User u WHERE u.negara = :negara")})
public class User implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "nama")
    private String nama;
    @Basic(optional = false)
    @Column(name = "telepon")
    private int telepon;
    @Basic(optional = false)
    @Column(name = "email")
    private String email;
    @Basic(optional = false)
    @Column(name = "alamat")
    private String alamat;
    @Basic(optional = false)
    @Column(name = "kota")
    private String kota;
    @Basic(optional = false)
    @Column(name = "provinsi")
    private String provinsi;
    @Basic(optional = false)
    @Column(name = "kodepos")
    private String kodepos;
    @Basic(optional = false)
    @Column(name = "negara")
    private int negara;

    public User() {
    }

    public User(Integer id) {
        this.id = id;
    }

    public User(Integer id, String nama, int telepon, String email, String alamat, String kota, String provinsi, String kodepos, int negara) {
        this.id = id;
        this.nama = nama;
        this.telepon = telepon;
        this.email = email;
        this.alamat = alamat;
        this.kota = kota;
        this.provinsi = provinsi;
        this.kodepos = kodepos;
        this.negara = negara;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNama() {
        return nama;
    }

    public void setNama(String nama) {
        this.nama = nama;
    }

    public int getTelepon() {
        return telepon;
    }

    public void setTelepon(int telepon) {
        this.telepon = telepon;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAlamat() {
        return alamat;
    }

    public void setAlamat(String alamat) {
        this.alamat = alamat;
    }

    public String getKota() {
        return kota;
    }

    public void setKota(String kota) {
        this.kota = kota;
    }

    public String getProvinsi() {
        return provinsi;
    }

    public void setProvinsi(String provinsi) {
        this.provinsi = provinsi;
    }

    public String getKodepos() {
        return kodepos;
    }

    public void setKodepos(String kodepos) {
        this.kodepos = kodepos;
    }

    public int getNegara() {
        return negara;
    }

    public void setNegara(int negara) {
        this.negara = negara;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof User)) {
            return false;
        }
        User other = (User) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "quiz2.User[ id=" + id + " ]";
    }
    
}
