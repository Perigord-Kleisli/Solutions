input ← (2⊸↑⋈2⊸↓)¨•BQN¨¨{𝕩∊"-1234567890"}⊸((¬-˜⊢×·+`»⊸>)⊸⊔)¨•Flines "input.txt"
Dist ← {x1‿y1 ← 𝕨 ⋄ x2‿y2 ← 𝕩 ⋄ (|x1-x2) + (|y1-y2) }
sensors ← (Dist´∾⊑)¨input
Slice ← {r‿x‿y←𝕩⋄ ⟨y-r,y+r⟩(⊑1=⍋)𝕨? 𝕨{⟨⟨x-𝕩,𝕨⟩,⟨x+𝕩,𝕨⟩⟩}r-|y-𝕨;⟨⟩ } 
(⍋(⊣+2÷˜-˜)´¨)⊸⊏⊑¨¨(0≠≠¨)⊸/ 10⊸Slice¨ (⊑ (10(⊑1=⍋)˜ -∾+) 2⊸⊑)¨⊸/sensors
Merge ← { 
  1≥≠𝕩? 𝕩 ;
  ⟨⟨x1,y1⟩‿⟨x2,y2⟩,xs⟩ ← 2(↑⋈↓)𝕩 
  x2≤1+y1? 𝕊⟨x1‿(y1⌈y2)⟩∾xs;
  (1↑𝕩) ∾ 𝕊 (1↓𝕩)
}
Row ← {Merge ∧⊑¨¨(0≠≠¨)⊸/ 𝕩⊸Slice¨ (⊑ (𝕩(⊑1=⍋)˜ -∾+) 2⊸⊑)¨⊸/sensors}
beacons ←  ≠{2e6=1⊑¨𝕩}⊸/⍷⊢´¨input
•Show beacons-˜|¬˜´⊑Row 2e6
y ← {𝕩-1} •_while_ {2≠≠Row 𝕩} 4e6
•Show y+4e6×1+1⊑∾Row y
