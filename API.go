package main

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"database/sql"
	_"github.com/go-sql-driver/mysql"
	"net/http"
	_ "database/sql"
	"time"

)
var database string = "tuBoletonDB"
var user string = "allan"
var password string= "allan2"
var addressDB string = "localhost:3306"

type Evento struct {

	ID_evento string `json: "id_evento"`
	Titulo string
	Descripcion string
	IdVenue string
	Fecha string
	Hora string
	CantGeneral string
	CantTribuna string
	CantVIP string
	cantGolden string
	PrecioGeneral string
	PrecioTribuna string
	PrecioVIP string
	PrecioGolden string

}

type boleto struct {
	Id_Boleto string
	Id_Cliente string
	id_Evento string
	Id_Tipo string
	Valor string
}


func connect () (*sql.DB) {
	db, err := sql.Open("mysql", user+":"+password+"@tcp("+addressDB+")/"+database)
	if err != nil {
		panic(err.Error()) // Just for example purpose. You should use proper error handling instead of panic
	}
	err = db.Ping()
	if err != nil {
		panic(err.Error()) // proper error handling instead of panic in your app
	}
	return db
}

func VerEventos(c *gin.Context){
	db := connect()
	defer db.Close()
	rows, err := db.Query(`SELECT * FROM eventos;`)
	if err != nil {
		panic(err)
	}
	//var evento [3]Evento
	var evento = make([]Evento,100)
	defer rows.Close()
	count := 0
	for rows.Next() {

		err = rows.Scan(
			&evento[count].ID_evento,
			&evento[count].Titulo,
			&evento[count].Descripcion,
			&evento[count].IdVenue,
			&evento[count].Fecha,
			&evento[count].Hora,
			&evento[count].CantGeneral,
			&evento[count].CantTribuna,
			&evento[count].CantVIP,
			&evento[count].cantGolden,
			&evento[count].PrecioGeneral,
			&evento[count].PrecioTribuna,
			&evento[count].PrecioVIP,
			&evento[count].PrecioGolden,
			)
		if err != nil {
			panic(err)
		}
		fmt.Println(evento)

		count = count +1
	}

	c.JSON(200, evento)

	err = rows.Err()
	if err != nil {
		panic(err)
	}

	}
func Loggin(c *gin.Context){

}


func insertEventos(c *gin.Context) {
	id := c.DefaultQuery("id","none")
	nombre := c.DefaultQuery("nombre","none")
	venuName := c.DefaultQuery("venu","none")
	fecha := c.DefaultQuery("fecha","none")
	if (id != "none" && nombre !="none" && venuName !="none" && fecha !="none") {
		db := connect()
		stmtIns, err := db.Prepare("INSERT INTO Eventos VALUES( ?,?,?, ? )") // ? = placeholder

		_, err = stmtIns.Exec(id, nombre, venuName, fecha)
		if err != nil {
			c.AbortWithStatus(http.StatusNoContent) // en caso de no conectar con la base de datos
		}

	}else {
		c.String(200,"No valido")
	}
}
func insertForm (c *gin.Context){
	id := c.DefaultPostForm("id","none")
	nombre := c.DefaultPostForm("nombre","none")
	venuName := c.DefaultPostForm("venu","none")
	fecha := c.DefaultPostForm("fecha","none")
	fmt.Println(id,nombre,venuName,fecha)
	if (id != "none" && nombre !="none" && venuName !="none" && fecha !="none") {
		db := connect()
		stmtIns, err := db.Prepare("INSERT INTO Eventos VALUES( ?,?,?, ? )") // ? = placeholder

		_, err = stmtIns.Exec(id, nombre, venuName, fecha)
		if err != nil {
			panic(err.Error()) // proper error handling instead of panic in your app
		}
		c.JSON(http.StatusOK,gin.H{
			"Estado" : "enviado",
			"fecha" : time.Now()})
	}else {
		c.String(200,"No valido")
	}

	}

func crearUsuario (c *gin.Context) {
	nombre := c.DefaultPostForm("nombre", "none")
	apellido := c.DefaultPostForm("apellido", "none")
	cedula := c.DefaultPostForm("cedula", "none")
	telefono := c.DefaultPostForm("telefono", "none")
	correo := c.DefaultPostForm("correo", "none")
	contraseña := c.DefaultPostForm("contraseña", "none")
	confirmarContraseña := c.DefaultPostForm("confirmar_contraseña", "none")
	if (nombre != "none" && apellido != "none" && cedula != "none" && contraseña != "none" && confirmarContraseña != "none") {
		if (len(contraseña) < 8) {
			c.String(http.StatusBadRequest, "Contraseña debe ser mayor a 8")
		} else if (contraseña != confirmarContraseña) {
			c.String(http.StatusBadRequest, "Contraseñas no coinciden")
		}
		db := connect()
		stmtIns, err := db.Prepare("INSERT INTO CLIENTES (nombre,apellido,cedula,telefono,correo) VALUES( ?,?,?,?,?,? )") // ? = placeholder

		_, err = stmtIns.Exec(nombre, apellido, cedula, telefono, correo)
		if err != nil {
			panic(err.Error()) // proper error handling instead of panic in your app
		}
		c.JSON(http.StatusOK, gin.H{
			"Estado": "enviado",
			"fecha":  time.Now()})
	} else {
		c.String(http.StatusBadRequest, "No valido")
	}
}
func crearEvento(c *gin.Context) {
	titulo := c.DefaultPostForm("titulo", "none")
	venu := c.DefaultPostForm("venu", "none")
	fecha := c.DefaultPostForm("fecha", "none")
	hora := c.DefaultPostForm("hora", "none")
	nboletos := c.DefaultPostForm("nboletos", "none")
	descripcion := c.DefaultPostForm("descripcion", "none")
	var id_venu string
	if (titulo != "none" && venu != "none" && fecha != "none" && hora != "none" && nboletos != "none") {

		db := connect()
		defer db.Close()
		row := db.QueryRow("SELECT ID_venue from Venues where nombre=$1 ", venu)
		err := row.Scan(&id_venu) //se coloca el valor de row a id_venu
		//se verifica si nu hubo error en la accion pasada
		if err != nil {
			if err == sql.ErrNoRows {
				fmt.Println("Zero rows found")
			} else {
				panic(err)
			}
		}

		//se prepara la variable para escribir en la base de datos
		stmtIns, err := db.Prepare("INSERT INTO Evento (titulo,id_venu,fecha,hora,#boletos,descricion) VALUES( ?,?,?,?,?,? )") // ? = placeholder
		//se ejecta el sql con los parametros pasados
		_, err = stmtIns.Exec(id_venu, fecha, hora, nboletos, descripcion)
		if err != nil {
			panic(err.Error()) // proper error handling instead of panic in your app
		}
		c.JSON(http.StatusOK, gin.H{
			"Estado": "enviado",
			"fecha":  time.Now()})
	} else {
		c.String(http.StatusBadRequest, "No valido")
	}
}


func login(c *gin.Context){
	user := c.DefaultPostForm("username","none")
	password := c.DefaultPostForm("password","none")
	if (user != "none" && password != "none"){
		var id_cliente string
		var pass string
		db := connect()
		defer db.Close()
		row := db.QueryRow("select ID_cliente from client where nombre=$1",user)
		err := row.Scan(&id_cliente) //se coloca el valor de row a id_venu

		if err != nil {
			if err == sql.ErrNoRows {
				c.String(http.StatusNotFound, "No existe tal usuario o el password esta mal")
			} else {
				panic(err)
			}
		}

		row2 := db.QueryRow("select password from password where cliente=$1",id_cliente)
		err2 := row2.Scan(&pass) //se coloca el valor de row a pass

		if err2 != nil {
			if err2 == sql.ErrNoRows {
				c.String(http.StatusNotFound, "No existe tal usuario o el password esta mal")
			} else {
				panic(err)
			}
		}

		if (pass == password){
			c.Header("Content-Type", "application/json")
			c.JSON(http.StatusOK, gin.H{
				"status" : "accpeted",
				"time" : time.Now(),
			} )
		}else {
			c.String(http.StatusNotFound, "No existe tal usuario o el password esta mal")
		}



	}
	}
func comprarBoleto(c *gin.Context) {
	id_cliente := c.DefaultQuery("id_clinte", "none")
	id_evento := c.DefaultQuery("id_Evento", "none")
	id_Tipo :=c.DefaultQuery("id_tipo", "none")
	//valor := c.DefaultQuery("valor", "none")
	var valor string
	tipoButaca := c.DefaultQuery("tipoButaca", "none")

	if (id_cliente != "none" && id_evento !="none" && id_Tipo !="none" && valor !="none" && tipoButaca != "none") {
		if(tipoButaca != "Tribuna" || tipoButaca != "General" || tipoButaca != "VIP" || tipoButaca != "Golden"){
			c.String(http.StatusBadRequest, "No existe ese tipo de butaca")
		}
		if (tipoButaca == "Tribuna"){
			valor = "$2"
		}else if (tipoButaca == "General"){
			valor = "$1"
		}else if (tipoButaca == "VIP"){
			valor = "$3"
		}else if (tipoButaca == "Golden"){
			valor = "$4"
		}
		db := connect()
		stmtIns, err := db.Prepare("INSERT INTO boletos (idCliente, idEvento,idTipo, valor, tipoButaca) VALUES( ?,?,?, ?, ? )") // ? = placeholder

		_, err = stmtIns.Exec(id_cliente,id_evento,id_Tipo, valor, tipoButaca)
		if err != nil {
			panic(err.Error()) // proper error handling instead of panic in your app
		}
		c.String(200, "Exitoso")

	}else {
		c.String(http.StatusBadRequest,"No valido")
	}
}


func main() {
	r := gin.Default()
	r.POST("/verEventos", VerEventos)
	r.GET("/loggin", Loggin)
	//r.POST("/comprarBoleto", ComprarBoleto)

	r.GET("/insert/Eventos", insertEventos)

	r.POST("/crearUsuario", crearUsuario)
	r.POST("/login", login)
	r.GET("/comprarBoleto", comprarBoleto)
	r.Run(":8081")
}

