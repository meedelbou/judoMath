/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.testmongodb;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.bson.Document;
import org.bson.types.ObjectId;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.gridfs.GridFSBucket;
import com.mongodb.client.gridfs.GridFSBuckets;
import com.mongodb.client.gridfs.GridFSDownloadStream;

import Models.Student;
import Models.Teacher;
import Models.User;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;

import java.util.Date;
import java.util.List;
import java.util.Base64;

/**
 *
 * @author medel
 */
@WebServlet(name = "etudiants", urlPatterns = {"/etudiants"})
public class etudiants extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<Student> etudiants = (List<Student>) session.getAttribute("etudiants");
        session.setAttribute("etudiants", etudiants);

        request.getRequestDispatcher("etudiants.jsp").forward(request, response);
    }

}
