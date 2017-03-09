/**
 * 
 */
package com.webprojet.web.authentification;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.webprojet.persistence.mysql.MySQL;
import com.webprojet.reservation.util.*;

/**
 * @author DaCodeManiak
 *
 */
public class Utilisateur {
	private String nom;
	private String login;
	private String password;
	private String salt;
	
	public Utilisateur(){}
	
	public void setLogin(String login){
		this.login = login;
	}
	
	public void setPassword(String password){
		this.password = password;
	}
	
	public boolean process(){
		MySQL base = new MySQL(new ReservationSetup());
		
		// TODO Récupérer un éventuel "sel" en fonction du login
		this.salt = this.getSalt(base);
		
		if(this.salt != null){
			// Okay, j'ai bien un utilisateur qui correspond, mais a-t-il saisi le bon mot de passe
			return this.authenticate(base);
		}
		return false;
	}
	
	private String getSalt(MySQL base){
		String sqlStatement = "SELECT salt FROM utilisateur WHERE login = ?;";
		try {
			PreparedStatement getSalt = base.get().prepareStatement(sqlStatement);
			getSalt.setString(1, this.login);
			ResultSet resultat = getSalt.executeQuery();
			if(resultat.next()){
				return resultat.getString("salt");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	private boolean authenticate(MySQL base){
		String sqlStatement = "SELECT nom FROM utilisateur WHERE login=? AND pass=?";
		try{
			PreparedStatement getUser = base.get().prepareStatement(sqlStatement);
			getUser.setString(1, this.login);
			getUser.setString(2, this.getMD5());
			ResultSet resultat = getUser.executeQuery();
			if(resultat.next()){
				this.nom = resultat.getString("nom");
				base.disconnect();
				return true;
			}
		} catch(SQLException e){
			e.printStackTrace();
		} finally{
			base.disconnect();
		}
		
		return false;
	}
	
	/**
	 * Méthode d'encryptage en MD5
	 */
	private String getMD5(){
		/**
		 * Génère le mot de passe final à encrypter... sel + mot de passe + sel
		 */
		String finalPassword = this.salt+this.password+this.salt;
		
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			/**
			 * Encrypte la chaîne octet par octet
			 */
			md.update(finalPassword.getBytes());
			byte[] digest = md.digest(); // Récupère le résultat
			
			/**
			 * Convertir le tableau d'octets en hexa pour stockage en base
			 */
			StringBuffer sb = new StringBuffer();
			/**
			 * On boucle sur chaque octet pour le convertir en hexa (0 .. f)
			 */
			for(byte b : digest){
				sb.append(String.format("%02x", b & 0xff));
			}
			
			/**
			 * On retourne la chaîne cryptée au format Hexadécimal
			 */
			return sb.toString();
			
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
}
