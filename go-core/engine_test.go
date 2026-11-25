package main
import "testing"
func TestProgressiveTax(t *testing.T){v,e:=Tax(150000,[]Bracket{{100000,.1},{200000,.2}});if e!=nil||v!=20000{t.Fatalf("got %v, %v",v,e)}}
func TestCashFlow(t *testing.T){rows:=[]Transaction{{"i","2026-01-01","Sale","income","Sales",100000,false},{"e","2026-01-02","Stock","expense","Stock",20000,true}};s,e:=Calculate(rows,Config{Brackets:[]Bracket{{1e9,.1}}});if e!=nil||s.NetCash!=80000||s.TaxReserve!=8000||s.SafeToSpend!=72000{t.Fatalf("%+v %v",s,e)}}
