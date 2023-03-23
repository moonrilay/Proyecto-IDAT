/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [COD_PRODUCTOS]
      ,[NOMBRE]
      ,[DESCRIPCION]
      ,[MARCA]
      ,[MODELO]
      ,[STOCK]
      ,[CATEGORIA]
  FROM [BD_LOGIN].[dbo].[productos]