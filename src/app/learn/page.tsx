import LessonPractice from "./lesson-practice";
export const metadata={title:"Your first Darija lesson | DARJIA WORLD",description:"A beginner-friendly introduction to Moroccan Darija greetings."};
export default function LearnPage(){return <main style={{maxWidth:900,margin:"0 auto",padding:"48px 24px"}}>
<a href="/" style={{color:"#bd684b",fontSize:13}}>← Back to DARJIA WORLD</a>
<p className="kicker" style={{marginTop:36}}>BEGINNER · LESSON 01</p>
<h1 style={{color:"#173f35",fontSize:"clamp(38px,6vw,58px)",margin:"12px 0"}}>Your first hello.</h1>
<p className="intro">Start with a simple Moroccan greeting and a friendly way to ask how someone is doing. These are introductory examples; regional usage and translations will receive human review before a full course release.</p>
<div style={{display:"grid",gridTemplateColumns:"repeat(auto-fit,minmax(220px,1fr))",gap:14,margin:"32px 0"}}>
{[{d:"سلام",r:"Salam",e:"Hello"},{d:"لاباس؟",r:"Labas?",e:"Are you well? / How are you?"},{d:"الحمد لله",r:"Lḥamdullah",e:"Thank God / I'm well, thanks"}].map(x=><article key={x.r} style={{background:"#fffdf8",border:"1px solid #e8e2d5",padding:24}}><div style={{fontSize:30,color:"#173f35"}} dir="rtl">{x.d}</div><h2 style={{fontFamily:"Georgia,serif",fontSize:25,fontWeight:400,color:"#173f35",margin:"12px 0 4px"}}>{x.r}</h2><p style={{color:"#6c7770",fontSize:14,margin:0}}>{x.e}</p></article>)}
</div>
<LessonPractice/>
</main>}