# MODULE 04: THE SYNTH COMPONENT (Atomic UI Design)

## OVERVIEW
This module isolates Layer 4 (The Presentation Layer). We are pretending the backend and internet do not exist. We will learn how Flutter physically commands the GPU to draw pixels, and how to build a scalable, unbreakable "Design System" (Lego bricks) that we can plug our future logic into.

---

## 🧪 THE PROGRESS TRACKER

### [ ] L1: MENTAL GYM (The Physics of the GPU Canvas)
- [ ] Understand the Constraint Model ("Constraints go down. Sizes go up. Parent sets position.")
- [ ] Understand the Render Tree (Widget -> Element -> RenderObject).
- [ ] Understand "Dumb" Widgets (Pure functions with no logic, only parameters).

### [ ] L2: SCALABLE SCAFFOLD (The Atomic Design System)
- [ ] Create `lib/features/m2-synth/`.
- [ ] Setup `core/theme/` (Color Hex Codes, Typography, Spacing Grid).
- [ ] Establish the "Gallery Screen" to display our components in isolation.

### [ ] L3: DEEP DOING (Manufacturing the Pipeline)
- [ ] **Drill 1: The Primitive Layer** (Mastering `Row`, `Column`, `Container`, `Padding`).
- [ ] **Drill 2: The Interactive Layer** (Capturing hardware inputs via `GestureDetector`).
- [ ] **Drill 3: The Assembly** (Combining atoms to build a `FlameUserCard`).
- [ ] **Drill 4: The Input Field** (Building a highly scalable `FlameTextField`).

### [ ] L4: HARDWARE DEBUGGER (X-Raying the GPU)
- [ ] Open Flutter DevTools Inspector.
- [ ] Identify 60 FPS "Jank" (Overloading the graphics math).
- [ ] Master `RepaintBoundary` (Quarantining pixels from unnecessary redraws).

---

## CURRENT STATUS: 
🟢 **Ready to begin L1: MENTAL GYM.** 
Awaiting engineer's signal to initiate the first physical concept: The Constraint Model.
