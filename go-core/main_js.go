//go:build js && wasm
package main
import("encoding/json";"syscall/js")
func run(this js.Value,args []js.Value)any{if len(args)<2{return "{\"error\":\"action and payload required\"}"};v,e:=Handle(args[0].String(),args[1].String());if e!=nil{b,_:=json.Marshal(map[string]string{"error":e.Error()});return string(b)};return v}
func main(){js.Global().Set("KodiTaxEngine",js.ValueOf(map[string]any{"run":js.FuncOf(run),"version":"1.0.0"}));select{}}
