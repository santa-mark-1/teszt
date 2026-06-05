"use client";
import { useState } from "react";

export default function LoginPage() {
  const [showPassword, setShowPassword] = useState<boolean>(false);

  return (
    <div className="min-h-screen flex items-center justify-center bg-[#111113] text-[#f0f0f0] px-4 py-8">
      <div className="w-full max-w-[400px]">

        {/* Logo */}
        <div className="text-center mb-8">
          <p className="text-[28px] font-bold text-[#f0f0f0]">
            Neighbor HAHAHAHAH<span className="font-normal text-[#888]">Hub</span>
          </p>
          <p className="text-sm text-[#888] mt-1.5">Csatlakozz a helyi közösséghez!</p>
        </div>

        {/* Card */}
        <div className="bg-[#1a1a1e] border border-[#2e2e35] rounded-2xl px-6 py-7">
          <h2 className="text-lg font-medium mb-5 text-[#f0f0f0]">Bejelentkezés</h2>

          {/* Username */}
          <label htmlFor="username" className="block text-[13px] text-[#888] mb-1.5">
            E-mail vagy felhasználónév
          </label>
          <input
            type="text"
            id="username"
            placeholder="pl. mate.kovacs vagy email@cím.hu"
            className="w-full px-3.5 py-3 rounded-lg border border-[#2e2e35] bg-[#111113] text-[#f0f0f0] text-[15px] outline-none mb-3 placeholder-[#555] transition-colors duration-200 focus:border-[#8b80e0]"
          />

          {/* Password */}
          <label htmlFor="password" className="block text-[13px] text-[#888] mb-1.5">
            Jelszó
          </label>
          <div className="relative mb-1.5">
            <input
              type={showPassword ? "text" : "password"}
              id="password"
              placeholder="Jelszó"
              className="w-full px-3.5 py-3 pr-11 rounded-lg border border-[#2e2e35] bg-[#111113] text-[#f0f0f0] text-[15px] outline-none placeholder-[#555] transition-colors duration-200 focus:border-[#8b80e0]"
            />
            <button
              onClick={() => setShowPassword(!showPassword)}
              aria-label="Jelszó megjelenítése"
              className="absolute right-3 top-1/2 -translate-y-1/2 text-lg text-[#666] bg-transparent border-none cursor-pointer p-0"
            >
              <i className={showPassword ? "ti ti-eye-off" : "ti ti-eye"} />
            </button>
          </div>

          {/* Forgot */}
          <div className="text-right mb-4">
            <a href="#" className="text-[13px] text-[#8b80e0] no-underline hover:underline">
              Elfelejtett jelszó?
            </a>
          </div>

          {/* Login button */}
          <button className="w-full py-3.5 rounded-lg bg-[#6b5fd4] border-none text-white text-base font-medium cursor-pointer transition-colors duration-200 hover:bg-[#5a4ec0]">
            Bejelentkezés
          </button>

          {/* Divider */}
          <div className="flex items-center gap-3 my-5 text-[#555] text-[13px] before:content-[''] before:flex-1 before:h-px before:bg-[#2e2e35] after:content-[''] after:flex-1 after:h-px after:bg-[#2e2e35]">
            vagy
          </div>

          {/* Google */}
          <button className="group w-full px-4 py-3 rounded-lg bg-[#1a1a1e] border border-[#2e2e35] text-[#f0f0f0] text-sm font-medium cursor-pointer flex items-center justify-center overflow-hidden mb-2.5 whitespace-nowrap transition-colors duration-200 hover:bg-[#222228] hover:border-[#444]">
            <span className="flex items-center flex-shrink-0 transition-transform duration-500 group-hover:scale-[1.08]">
              <svg width="20" height="20" viewBox="0 0 18 18" fill="none" aria-hidden="true">
                <path d="M17.64 9.2c0-.637-.057-1.251-.164-1.84H9v3.481h4.844a4.14 4.14 0 0 1-1.796 2.717v2.258h2.908c1.702-1.567 2.684-3.875 2.684-6.615Z" fill="#4285F4"/>
                <path d="M9 18c2.43 0 4.467-.806 5.956-2.18l-2.908-2.259c-.806.54-1.837.86-3.048.86-2.344 0-4.328-1.584-5.036-3.711H.957v2.332A8.997 8.997 0 0 0 9 18Z" fill="#34A853"/>
                <path d="M3.964 10.71A5.41 5.41 0 0 1 3.682 9c0-.593.102-1.17.282-1.71V4.958H.957A8.996 8.996 0 0 0 0 9c0 1.452.348 2.827.957 4.042l3.007-2.332Z" fill="#FBBC05"/>
                <path d="M9 3.58c1.321 0 2.508.454 3.44 1.345l2.582-2.58C13.463.891 11.426 0 9 0A8.997 8.997 0 0 0 .957 4.958L3.964 6.29C4.672 4.163 6.656 3.58 9 3.58Z" fill="#EA4335"/>
              </svg>
            </span>
            <span className="max-w-0 overflow-hidden opacity-0 -translate-x-1 ml-0 transition-all duration-500 group-hover:max-w-[200px] group-hover:opacity-100 group-hover:translate-x-0 group-hover:ml-2.5">
              Folytatás Google-lal
            </span>
          </button>

          {/* Facebook */}
          <button className="group w-full px-4 py-3 rounded-lg bg-[#1a1a1e] border border-[#2e2e35] text-[#f0f0f0] text-sm font-medium cursor-pointer flex items-center justify-center overflow-hidden whitespace-nowrap transition-colors duration-200 hover:bg-[#222228] hover:border-[#444]">
            <span className="flex items-center flex-shrink-0 transition-transform duration-500 group-hover:scale-[1.08]">
              <svg width="22" height="22" viewBox="0 0 24 24" fill="#1877F2" aria-hidden="true">
                <path d="M24 12.073C24 5.404 18.627 0 12 0S0 5.404 0 12.073C0 18.1 4.388 23.094 10.125 24v-8.437H7.078v-3.49h3.047V9.41c0-3.025 1.791-4.697 4.533-4.697 1.312 0 2.686.235 2.686.235v2.97h-1.513c-1.491 0-1.956.93-1.956 1.886v2.268h3.328l-.532 3.49h-2.796V24C19.612 23.094 24 18.1 24 12.073z"/>
              </svg>
            </span>
            <span className="max-w-0 overflow-hidden opacity-0 -translate-x-1 ml-0 transition-all duration-500 group-hover:max-w-[200px] group-hover:opacity-100 group-hover:translate-x-0 group-hover:ml-2.5">
              Folytatás Facebook-kal
            </span>
          </button>
        </div>

        {/* Register link */}
        <div className="text-center mt-5 text-sm text-[#888]">
          Még nincs fiókod?{" "}
          <a href="/register" className="text-[#8b80e0] font-medium no-underline hover:underline">
            Regisztráció
          </a>
        </div>

        {/* Privacy note */}
        <div className="mt-6 px-4 py-3.5 bg-[#1a1a1e] rounded-lg flex gap-2.5 items-start">
          <i className="ti ti-shield-check text-lg text-[#8b80e0] flex-shrink-0 mt-px" />
          <p className="text-xs text-[#888] leading-relaxed">
            A bejelentkezéssel elfogadod az{" "}
            <a href="/privacy" className="text-[#8b80e0] no-underline hover:underline">Adatvédelmi irányelveket</a>
            {" "}és az{" "}
            <a href="/terms" className="text-[#8b80e0] no-underline hover:underline">Általános szerződési feltételeket</a>.
          </p>
        </div>

      </div>
    </div>
  );
}
