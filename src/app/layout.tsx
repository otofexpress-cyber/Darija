import type { Metadata } from "next";
import "./globals.css";
export const metadata: Metadata = {
  title: "DARJIA WORLD — Speak Moroccan. Connect with Morocco.",
  description: "Learn Moroccan Darija through practical lessons, culture, and guided speaking practice.",
  applicationName: "DARJIA WORLD",
  manifest: "/manifest.webmanifest"
};
export default function RootLayout({children}:{children:React.ReactNode}) {
  return <html lang="en"><body>{children}</body></html>;
}