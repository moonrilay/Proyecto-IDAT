from PyQt5 import QtWidgets, uic, QtCore
from PyQt5.QtCore import QTimer
import pyodbc

app = QtWidgets.QApplication([])


login = uic.loadUi("ventana_01.ui")
entrar = uic.loadUi("ventana_06.ui")
error = uic.loadUi("ventana_03.ui")
registro = uic.loadUi("ventana_04.ui")
exito = uic.loadUi("ventana_05.ui")

def gui_login():
    name = login.lineEdit.text()
    password_input = login.lineEdit_2.text()
    if len(name)==0 or len(password_input)==0:
        login.label_5.setText("Ingrese todos los datos")
    else:
        # Conexion base de datos
        server = 'MANUEL\SQLEXPRESS'
        database = 'BD_LOGIN'
        username = 'soporte'
        password = '70881345'
        cnxn = pyodbc.connect(f'Driver=SQL Server;Server={server};Database={database};UID={username};PWD={password}')

        # Comprobar si existe el usuario en la base de datos
        cursor = cnxn.cursor()
        cursor.execute("SELECT usuario, contrasena FROM usuarios WHERE usuario=? AND contrasena=?", (name, password_input))
        row = cursor.fetchone()
        if row is not None:
            # Usuario encontrado, vaya a la siguiente pantalla
            entrar.show()
        else:
            # Usuario no encontrado, mostrar pantalla de error
            error.show()

def agregar_producto():
    # Obtener los datos del formulario
    nombre = entrar.line_NOMBRE.text()
    descripcion = entrar.line_DESCR.text()
    marca = entrar.line_MARCA.text()
    modelo = entrar.line_MODELO.text()
    stock = entrar.line_STOCK.text()
    categoria = entrar.line_CATE.text()
    codigo = entrar.line_COD.text()

    # Conexion base de datos
    server = 'MANUEL\SQLEXPRESS'
    database = 'BD_LOGIN'
    username = 'soporte'
    password = '70881345'
    cnxn = pyodbc.connect(f'Driver=SQL Server;Server={server};Database={database};UID={username};PWD={password}')

    # Insertar los datos del producto en la base de datos
    cursor = cnxn.cursor()
    cursor.execute("INSERT INTO productos (COD_PRODUCTOS, NOMBRE, DESCRIPCION, MARCA, MODELO, STOCK, CATEGORIA) VALUES (?, ?, ?, ?, ?, ?, ?)", (codigo, nombre, descripcion, marca, modelo, stock, categoria))
    cnxn.commit()

    # Mostrar mensaje de éxito
    entrar.label_AGREGAR.setText("Producto agregado exitosamente")
    QTimer.singleShot(10000, lambda: entrar.label_AGREGAR.setText(""))

    # Limpiar los campos de entrada
    entrar.line_NOMBRE.setText("")
    entrar.line_DESCR.setText("")
    entrar.line_MARCA.setText("")
    entrar.line_MODELO.setText("")
    entrar.line_STOCK.setText("")
    entrar.line_CATE.setText("")
    entrar.line_COD.setText("")

def cargar_datos_productos():
    # Conexión a la base de datos
    server = 'MANUEL\SQLEXPRESS'
    database = 'BD_LOGIN'
    username = 'soporte'
    password = '70881345'
    cnxn = pyodbc.connect(f'Driver=SQL Server;Server={server};Database={database};UID={username};PWD={password}')

    # Consulta a la base de datos
    query = 'SELECT COD_PRODUCTOS, NOMBRE, DESCRIPCION, MARCA, MODELO, STOCK, CATEGORIA FROM dbo.productos'
    cursor = cnxn.cursor()
    cursor.execute(query)
    data = cursor.fetchall()

    # Cargar los datos en la tabla de la interfaz gráfica
    table = entrar.table_PRODUCTO
    table.setColumnCount(len(data[0]))
    table.setRowCount(len(data))
    for i, row in enumerate(data):
        for j, item in enumerate(row):
            table.setItem(i, j, QtWidgets.QTableWidgetItem(str(item)))


def refrescar_tabla():
    # Obtener la conexión a la base de datos
    server = 'MANUEL\SQLEXPRESS'
    database = 'BD_LOGIN'
    username = 'soporte'
    password = '70881345'
    cnxn = pyodbc.connect(f'Driver=SQL Server;Server={server};Database={database};UID={username};PWD={password}')

    # Ejecutar la consulta SQL
    query = 'SELECT COD_PRODUCTOS, NOMBRE, DESCRIPCION, MARCA, MODELO, STOCK, CATEGORIA FROM dbo.productos'
    cursor = cnxn.cursor()
    cursor.execute(query)
    data = cursor.fetchall()

    # Limpiar la tabla
    table = entrar.table_PRODUCTO
    table.clearContents()

    # Cargar los nuevos datos en la tabla
    table.setRowCount(len(data))
    for i, row in enumerate(data):
        for j, item in enumerate(row):
            table.setItem(i, j, QtWidgets.QTableWidgetItem(str(item)))

def mostrar_placa_madre():
    # Conexión a la base de datos
    server = 'MANUEL\SQLEXPRESS'
    database = 'BD_LOGIN'
    username = 'soporte'
    password = '70881345'
    cnxn = pyodbc.connect(f'Driver=SQL Server;Server={server};Database={database};UID={username};PWD={password}')

    # Consulta a la base de datos
    query = "SELECT COD_PRODUCTOS, NOMBRE, DESCRIPCION, MARCA, MODELO, STOCK, CATEGORIA FROM dbo.productos WHERE CATEGORIA = 'placa madre'"
    cursor = cnxn.cursor()
    cursor.execute(query)
    data = cursor.fetchall()

    # Cargar los datos en la tabla de la interfaz gráfica
    table = entrar.table_PRODUCTO
    table.setColumnCount(len(data[0]))
    table.setRowCount(len(data))
    for i, row in enumerate(data):
        for j, item in enumerate(row):
            table.setItem(i, j, QtWidgets.QTableWidgetItem(str(item)))
    entrar.tabWidget.setCurrentWidget(entrar.tab_PRODUCTOS)
entrar.boton_categoria_1.clicked.connect(mostrar_placa_madre)

def mostrar_memoria_ram():
    # Conexión a la base de datos
    server = 'MANUEL\SQLEXPRESS'
    database = 'BD_LOGIN'
    username = 'soporte'
    password = '70881345'
    cnxn = pyodbc.connect(f'Driver=SQL Server;Server={server};Database={database};UID={username};PWD={password}')

    # Consulta a la base de datos
    query = "SELECT COD_PRODUCTOS, NOMBRE, DESCRIPCION, MARCA, MODELO, STOCK, CATEGORIA FROM dbo.productos WHERE CATEGORIA = 'memoria ram'"
    cursor = cnxn.cursor()
    cursor.execute(query)
    data = cursor.fetchall()

    # Cargar los datos en la tabla de la interfaz gráfica
    table = entrar.table_PRODUCTO
    table.setColumnCount(len(data[0]))
    table.setRowCount(len(data))
    for i, row in enumerate(data):
        for j, item in enumerate(row):
            table.setItem(i, j, QtWidgets.QTableWidgetItem(str(item)))
    entrar.tabWidget.setCurrentWidget(entrar.tab_PRODUCTOS)
entrar.boton_categoria_2.clicked.connect(mostrar_memoria_ram)

def mostrar_tarjeta_video():
    # Conexión a la base de datos
    server = 'MANUEL\SQLEXPRESS'
    database = 'BD_LOGIN'
    username = 'soporte'
    password = '70881345'
    cnxn = pyodbc.connect(f'Driver=SQL Server;Server={server};Database={database};UID={username};PWD={password}')

    # Consulta a la base de datos
    query = "SELECT COD_PRODUCTOS, NOMBRE, DESCRIPCION, MARCA, MODELO, STOCK, CATEGORIA FROM dbo.productos WHERE CATEGORIA = 'tarjeta de video'"
    cursor = cnxn.cursor()
    cursor.execute(query)
    data = cursor.fetchall()

    # Cargar los datos en la tabla de la interfaz gráfica
    table = entrar.table_PRODUCTO
    table.setColumnCount(len(data[0]))
    table.setRowCount(len(data))
    for i, row in enumerate(data):
        for j, item in enumerate(row):
            table.setItem(i, j, QtWidgets.QTableWidgetItem(str(item)))
    entrar.tabWidget.setCurrentWidget(entrar.tab_PRODUCTOS)
entrar.boton_categoria_3.clicked.connect(mostrar_tarjeta_video)

def mostrar_procesadores():
    # Conexión a la base de datos
    server = 'MANUEL\SQLEXPRESS'
    database = 'BD_LOGIN'
    username = 'soporte'
    password = '70881345'
    cnxn = pyodbc.connect(f'Driver=SQL Server;Server={server};Database={database};UID={username};PWD={password}')

    # Consulta a la base de datos
    query = "SELECT COD_PRODUCTOS, NOMBRE, DESCRIPCION, MARCA, MODELO, STOCK, CATEGORIA FROM dbo.productos WHERE CATEGORIA = 'procesadores'"
    cursor = cnxn.cursor()
    cursor.execute(query)
    data = cursor.fetchall()

    # Cargar los datos en la tabla de la interfaz gráfica
    table = entrar.table_PRODUCTO
    table.setColumnCount(len(data[0]))
    table.setRowCount(len(data))
    for i, row in enumerate(data):
        for j, item in enumerate(row):
            table.setItem(i, j, QtWidgets.QTableWidgetItem(str(item)))
    entrar.tabWidget.setCurrentWidget(entrar.tab_PRODUCTOS)
entrar.boton_categoria_4.clicked.connect(mostrar_procesadores)

def mostrar_Almacenamiento():
    # Conexión a la base de datos
    server = 'MANUEL\SQLEXPRESS'
    database = 'BD_LOGIN'
    username = 'soporte'
    password = '70881345'
    cnxn = pyodbc.connect(f'Driver=SQL Server;Server={server};Database={database};UID={username};PWD={password}')

    # Consulta a la base de datos
    query = "SELECT COD_PRODUCTOS, NOMBRE, DESCRIPCION, MARCA, MODELO, STOCK, CATEGORIA FROM dbo.productos WHERE CATEGORIA = 'Almacenamiento'"
    cursor = cnxn.cursor()
    cursor.execute(query)
    data = cursor.fetchall()

    # Cargar los datos en la tabla de la interfaz gráfica
    table = entrar.table_PRODUCTO
    table.setColumnCount(len(data[0]))
    table.setRowCount(len(data))
    for i, row in enumerate(data):
        for j, item in enumerate(row):
            table.setItem(i, j, QtWidgets.QTableWidgetItem(str(item)))
    entrar.tabWidget.setCurrentWidget(entrar.tab_PRODUCTOS)
entrar.boton_categoria_5.clicked.connect(mostrar_Almacenamiento)

def mostrar_Refrigeración():
    # Conexión a la base de datos
    server = 'MANUEL\SQLEXPRESS'
    database = 'BD_LOGIN'
    username = 'soporte'
    password = '70881345'
    cnxn = pyodbc.connect(f'Driver=SQL Server;Server={server};Database={database};UID={username};PWD={password}')

    # Consulta a la base de datos
    query = "SELECT COD_PRODUCTOS, NOMBRE, DESCRIPCION, MARCA, MODELO, STOCK, CATEGORIA FROM dbo.productos WHERE CATEGORIA = 'Refrigeración'"
    cursor = cnxn.cursor()
    cursor.execute(query)
    data = cursor.fetchall()

    # Cargar los datos en la tabla de la interfaz gráfica
    table = entrar.table_PRODUCTO
    table.setColumnCount(len(data[0]))
    table.setRowCount(len(data))
    for i, row in enumerate(data):
        for j, item in enumerate(row):
            table.setItem(i, j, QtWidgets.QTableWidgetItem(str(item)))
    entrar.tabWidget.setCurrentWidget(entrar.tab_PRODUCTOS)
entrar.boton_categoria_6.clicked.connect(mostrar_Refrigeración)

def mostrar_Case():
    # Conexión a la base de datos
    server = 'MANUEL\SQLEXPRESS'
    database = 'BD_LOGIN'
    username = 'soporte'
    password = '70881345'
    cnxn = pyodbc.connect(f'Driver=SQL Server;Server={server};Database={database};UID={username};PWD={password}')

    # Consulta a la base de datos
    query = "SELECT COD_PRODUCTOS, NOMBRE, DESCRIPCION, MARCA, MODELO, STOCK, CATEGORIA FROM dbo.productos WHERE CATEGORIA = 'Case'"
    cursor = cnxn.cursor()
    cursor.execute(query)
    data = cursor.fetchall()

    # Cargar los datos en la tabla de la interfaz gráfica
    table = entrar.table_PRODUCTO
    table.setColumnCount(len(data[0]))
    table.setRowCount(len(data))
    for i, row in enumerate(data):
        for j, item in enumerate(row):
            table.setItem(i, j, QtWidgets.QTableWidgetItem(str(item)))
    entrar.tabWidget.setCurrentWidget(entrar.tab_PRODUCTOS)
entrar.boton_categoria_7.clicked.connect(mostrar_Case)

def mostrar_Periféricos():
    # Conexión a la base de datos
    server = 'MANUEL\SQLEXPRESS'
    database = 'BD_LOGIN'
    username = 'soporte'
    password = '70881345'
    cnxn = pyodbc.connect(f'Driver=SQL Server;Server={server};Database={database};UID={username};PWD={password}')

    # Consulta a la base de datos
    query = "SELECT COD_PRODUCTOS, NOMBRE, DESCRIPCION, MARCA, MODELO, STOCK, CATEGORIA FROM dbo.productos WHERE CATEGORIA = 'Periféricos'"
    cursor = cnxn.cursor()
    cursor.execute(query)
    data = cursor.fetchall()

    # Cargar los datos en la tabla de la interfaz gráfica
    table = entrar.table_PRODUCTO
    table.setColumnCount(len(data[0]))
    table.setRowCount(len(data))
    for i, row in enumerate(data):
        for j, item in enumerate(row):
            table.setItem(i, j, QtWidgets.QTableWidgetItem(str(item)))
    entrar.tabWidget.setCurrentWidget(entrar.tab_PRODUCTOS)
entrar.boton_categoria_8.clicked.connect(mostrar_Periféricos)


def gui_entrar():
    login.hide()
    entrar.tabWidget.tab()
    entrar.show()


def gui_error():
    login.hide()
    error.show()


def gui_registro():
    login.hide()
    registro.show()


def regresar_entrar():
    entrar.hide()
    login.label_5.setText("")
    login.show()    

def regresar_error():
    error.hide()
    login.label_5.setText("")
    login.show() 
    error.pushButton.setEnabled(False)
    QtCore.QTimer.singleShot(10000, lambda: error.pushButton.setEnabled(True))
error.pushButton.clicked.connect(regresar_entrar)

def gui_registro():
    # Obtener los valores ingresados por el usuario
    nombre = registro.lineEdit.text()
    apellido = registro.lineEdit_2.text()
    direccion = registro.lineEdit_3.text()
    cargo = registro.lineEdit_4.text()
    fecha_inicio = registro.lineEdit_5.text()
    usuario = registro.lineEdit_6.text()
    contrasena = registro.lineEdit_7.text()

    # Validar los valores ingresados por el usuario
    if len(nombre) == 0 or len(apellido) == 0 or len(direccion) == 0 or len(cargo) == 0 or len(fecha_inicio) == 0 or len(usuario) == 0 or len(contrasena) == 0:
        registro.label_12.setText("Ingrese todos los datos")
        registro.show()
        return

    # Conectar a la base de datos
    server = 'MANUEL\SQLEXPRESS'
    database = 'BD_LOGIN'
    username = 'soporte'
    password = '70881345'
    cnxn = pyodbc.connect(f'Driver=SQL Server;Server={server};Database={database};UID={username};PWD={password}')

    # Verificar si el usuario ya está registrado
    cursor = cnxn.cursor()
    cursor.execute("SELECT * FROM registro_usuarios WHERE usuario = ?", (usuario,))
    rows = cursor.fetchall()
    if len(rows) > 0:
        registro.label_12.setText("El usuario ya está registrado")
        registro.show()
        return

    # Insertar los datos del registro en la tabla
    try:
        cursor = cnxn.cursor()
        cursor.execute("INSERT INTO registro_usuarios (nombre, apellido, direccion, cargo, fecha_inicio, usuario, contrasena) VALUES (?, ?, ?, ?, ?, ?, ?)",
                       (nombre, apellido, direccion, cargo, fecha_inicio, usuario, contrasena))
        cnxn.commit()

        # Validar que se haya insertado el registro correctamente
        if cursor.rowcount == 1:
            # Si todo está bien, mostrar la ventana de éxito
            exito.show()
            registro.hide()
        else:
            registro.label_12.setText("Error al insertar registro")
            registro.show()

    except Exception as e:
        registro.label_12.setText("Error al insertar registro")
        registro.show()
        print(str(e))

    # Cerrar la conexión
    cursor.close()
    cnxn.close()

def regresar_registro():
    registro.hide()
    registro.label_12.setText("")
    login.show()  

def regresar_exito():
    exito.hide()
    login.show()

def regresar_login(self):
    # Ocultar la ventana actual y mostrar la ventana de login
    self.exito.hide()
    self.login.show()


def salir():
    app.exit()


login.pushButton.clicked.connect(gui_login)
login.pushButton_2.clicked.connect(gui_registro)
login.pushButton_3.clicked.connect(salir)  

entrar.Button_AGREGAR.clicked.connect(agregar_producto)
entrar.Button_SALIR.clicked.connect(salir)
entrar.ButtoN_REFRESCAR.clicked.connect(refrescar_tabla)

error.pushButton.clicked.connect(regresar_error)
error.pushButton_3.clicked.connect(salir)

registro.pushButton.clicked.connect(regresar_registro)
registro.pushButton_2.clicked.connect(regresar_registro)
registro.pushButton.clicked.connect(gui_registro)
registro.pushButton_3.clicked.connect(salir) 

exito.pushButton.clicked.connect(regresar_exito)

login.show()
app.exec()
