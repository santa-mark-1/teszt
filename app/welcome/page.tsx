export default function WelcomePage() {
  return (
    <div className="min-h-screen flex items-center justify-center bg-[#111113] text-[#f0f0f0] px-4 py-8">
      <div className="w-full max-w-[400px]">

        {/* Logo */}
        <div className="text-center mb-8">
          <p className="text-[28px] font-bold text-[#f0f0f0]">
            Neighbor<span className="font-normal text-[#888]">Hub</span>
          </p>
          <p className="text-sm text-[#888] mt-1.5">Csatlakozz a helyi közösséghez!</p>
        </div>

        {/* Card */}
        <div className="bg-[#1a1a1e] border border-[#2e2e35] rounded-2xl px-6 py-12 flex flex-col items-center gap-6">
          <div className="w-16 h-16 rounded-full bg-[#6b5fd4] flex items-center justify-center">
            <i className="ti ti-check text-3xl text-white" />
          </div>
          <h1 className="text-4xl font-bold text-center tracking-wide text-[#f0f0f0]">
            GRATULÁLOK!
          </h1>
          <p className="text-sm text-[#888] text-center">
            Sikeresen bejelentkeztél a NeighborHub fiókodba.
          </p>
          <a
            href="/login"
            className="mt-2 text-[13px] text-[#8b80e0] no-underline hover:underline"
          >
            Vissza a bejelentkezéshez
          </a>
        </div>

      </div>
    </div>
  );
}
