"use client";
import {useState} from "react";
export default function LessonPractice(){
 const [answer,setAnswer]=useState("");
 const [checked,setChecked]=useState(false);
 const correct=answer==="hello";
 return <section style={{background:"#eee7d9",padding:24,border:"1px solid #e3dac8",marginTop:24}}>
 <p style={{fontSize:11,letterSpacing:".16em",color:"#bd684b",fontWeight:700}}>QUICK CHECK</p>
 <h2 style={{fontFamily:"Georgia,serif",fontSize:28,fontWeight:400,color:"#173f35"}}>What does “Salam” mean?</h2>
 <div style={{display:"grid",gap:10,marginTop:18}}>
 {[{v:"hello",t:"Hello"},{v:"please",t:"Please"},{v:"goodbye",t:"Goodbye"}].map(o=><label key={o.v} style={{display:"flex",gap:10,alignItems:"center",padding:13,background:"#fffdf8",border:"1px solid #ded7c9",cursor:"pointer"}}><input type="radio" name="answer" value={o.v} checked={answer===o.v} onChange={()=>{setAnswer(o.v);setChecked(false)}}/>{o.t}</label>)}
 </div>
 <button disabled={!answer} onClick={()=>setChecked(true)} style={{marginTop:18,background:"#173f35",color:"white",padding:"12px 20px",border:0,borderRadius:3,opacity:answer?1:.5,cursor:answer?"pointer":"not-allowed"}}>Check answer</button>
 {checked&&<p role="status" style={{fontWeight:600,color:correct?"#216b4a":"#a54e37",marginBottom:0}}>{correct?"Correct — Salam means hello.":"Not quite. Try again: Salam is a greeting meaning hello."}</p>}
 </section>
}