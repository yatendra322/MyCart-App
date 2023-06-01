package com.learn.mycart.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.learn.mycart.entities.Product;

public class ProductDao {

	public SessionFactory factory;

	public ProductDao(SessionFactory factory) {
		this.factory=factory;
	}
	
	public boolean saveProduct(Product product) {
		boolean f=false;
		try {
			Session session=this.factory.openSession();
			Transaction tx=session.beginTransaction();
			session.save(product);
			tx.commit();
			session.close();
			f=true;
		} catch (Exception e) {
			e.printStackTrace();
			f=false;
		}
		return f;
	}
	
	//Get All products
	public List<Product> getAllProducts(){
		Session se=this.factory.openSession();
		Query query=se.createQuery("from Product");
		List<Product> list = query.list();
		return list;
		
	}
	
	//Get All products by categoryId
		public List<Product> getAllProductsByCategoryId(int cId){
			Session se=this.factory.openSession();
			Query query=se.createQuery("from Product as p where p.category.categoryId=:id");
			query.setParameter("id",cId);
			List<Product> list = query.list();
			return list;
			
		}

}
