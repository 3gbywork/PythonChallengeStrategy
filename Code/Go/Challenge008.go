package main

import(
	"fmt"
	"os"
	"compress/bzip2"
	"io/ioutil"
)

func (c *Challenge) Challenge008() {
	unfile:=".\\Data\\008\\user.bz2"
	pwfile:=".\\Data\\008\\pwd.bz2"

	username:=bz2Decode(unfile)
	password:=bz2Decode(pwfile)

	fmt.Printf("username: %s\npassword: %s\n", username, password)
}

func bz2Decode(filename string) string {
	reader,err := os.Open(filename)
	if err != nil {
		fmt.Printf("open file %s failed![%v]", filename, err)
		return ""
	}
	defer reader.Close()

	bzrd := bzip2.NewReader(reader)

	bytes,ierr := ioutil.ReadAll(bzrd)
	if ierr != nil {
		fmt.Printf("read file %s failed![%v]", filename, ierr)
		return ""
	}

	return string(bytes)
}