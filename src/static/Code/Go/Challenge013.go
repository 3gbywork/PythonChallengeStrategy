package main

import(
	"fmt"
	"github.com/kolo/xmlrpc"
)

func (c *Challenge) Challenge013() {
	client, err := xmlrpc.NewClient("http://www.pythonchallenge.com/pc/phonebook.php", nil)
	if err != nil {
		fmt.Println("Can't create client: ", err)
	}
	defer client.Close()

	// var methods []string
	// client.Call("system.listMethods", nil, &methods)
	// fmt.Println(methods)

	// var signature [][]string
	// client.Call("system.methodSignature", "phone", &signature)
	// fmt.Println(signature)

	// var help string
	// client.Call("system.methodHelp", "phone", &help)
	// fmt.Println(help)

	var result string
	client.Call("phone", "Bert", &result)
	fmt.Println(result)
}