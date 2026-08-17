from pathlib import Path
import unittest


ROOT = Path(__file__).resolve().parents[1]
TEMPLATE = ROOT / "40_works" / "_template"


class CloneTextureTemplateContractTests(unittest.TestCase):
    def read_template(self, relative_path: str) -> str:
        return (TEMPLATE / relative_path).read_text(encoding="utf-8")

    def test_source_feed_records_variable_role_bound_bundle(self) -> None:
        prompt = self.read_template("00_source_feed_prompt.md")
        self.assertIn("base_source", prompt)
        self.assertIn("supporting_sources", prompt)
        self.assertIn("source_bundle", prompt)
        self.assertIn("excluded_sources", prompt)
        self.assertIn("human_texture_function", prompt)
        self.assertIn("social_witness_or_aftershock", prompt)
        self.assertIn("material_conversion", prompt)

    def test_episode_bet_limits_render_selection_to_two_or_three_entries(self) -> None:
        episode_bet = self.read_template("03_episode_bet/ep000_episode_bet.md")
        self.assertIn("render_selection", episode_bet)
        self.assertIn("2–3", episode_bet)
        self.assertIn("must_make_visible", episode_bet)
        self.assertIn("do_not_turn_into", episode_bet)

    def test_dispatch_receives_selected_rendering_brief_once(self) -> None:
        dispatch = self.read_template("07_dispatch/ep000_dispatch.md")
        self.assertIn("render_selection", dispatch)
        self.assertIn("Episode Bet", dispatch)
        self.assertIn("action/reaction/material", dispatch)

    def test_relay_enforces_render_selection_and_compiles_it_once(self) -> None:
        relay = (ROOT / "tools" / "draft_relay" / "Invoke-DraftRelay.ps1").read_text(encoding="utf-8")
        self.assertIn("function Assert-RenderSelection", relay)
        self.assertIn("exactly 2-3 entries", relay)
        self.assertIn("function Format-RenderSelectionBlock", relay)
        self.assertIn("## Compiled render selection", relay)

    def test_relay_blind_packet_and_route_preserve_review_contract(self) -> None:
        relay = (ROOT / "tools" / "draft_relay" / "Invoke-DraftRelay.ps1").read_text(encoding="utf-8")
        self.assertIn("first remembered sensory/object/action anchor", relay)
        self.assertIn("independent response or changed behavior", relay)
        self.assertIn("abstract procedural surface", relay)
        self.assertIn("function Assert-ExternalReviewerLane", relay)
        self.assertIn("reviewer_lane", relay)
        self.assertIn('[string]$Producer = "webgpt"', relay)
        self.assertIn('[string]$ReviewerLane = "codex-5.6-terra"', relay)
        self.assertIn("if ($value -match 'web[ _-]?gpt') { return 'webgpt' }", relay)
        self.assertIn("producer_lane: $Producer", relay)
        self.assertIn("reviewer_lane: $ReviewerLane", relay)

    def test_relay_separates_native_history_from_legacy_bridge(self) -> None:
        relay = (ROOT / "tools" / "draft_relay" / "Invoke-DraftRelay.ps1").read_text(encoding="utf-8")
        self.assertIn("production_stage=manuscript", relay)
        self.assertIn("authority=owner_approved", relay)
        self.assertIn("imported_legacy_bridge", relay)
        self.assertIn("Resolve-SourceFeedReceipt", relay)

    def test_story_arcs_are_capped_and_reflow_after_close(self) -> None:
        arc_route = self.read_template("02_story/arc_route_rail.md")
        corridor = self.read_template("02_story/rolling_corridor.md")
        terminology = (ROOT / "00_charter" / "terminology.md").read_text(encoding="utf-8")
        relay = (ROOT / "tools" / "draft_relay" / "Invoke-DraftRelay.ps1").read_text(encoding="utf-8")

        self.assertIn("schema_version: firefly_arc_route_rail_v1", arc_route)
        self.assertIn("route_to_ending: required", arc_route)
        self.assertIn("hypothesis_detail_policy: durable_only", arc_route)
        self.assertIn("reflow_policy: revalidate_durable_invalidate_volatile", arc_route)
        self.assertIn("arc_episode_cap: 3", corridor)
        self.assertIn("current_b_arc:", corridor)
        self.assertIn("next_b_arc:", corridor)
        self.assertIn("status: provisional", corridor)
        self.assertIn("b_rail_durable_fields: revalidate", corridor)
        self.assertIn("b_rail_volatile_fields: invalidate_and_rebuild", corridor)
        self.assertIn("A-Rail", terminology)
        self.assertIn("B-Rail", terminology)
        self.assertIn("arc_pacing_profile", terminology)
        self.assertIn("function Assert-ArcRouteRailContract", relay)
        self.assertIn("function Assert-RollingArcContract", relay)
        self.assertIn("Story Arc hard span exceeds profile cap", relay)
        self.assertIn('"arc-contract-smoke"', relay)
        self.assertIn("function Invoke-ArcContractSmoke", relay)

    def test_user_surface_has_three_levels_while_story_plan_keeps_four_internal_files(self) -> None:
        status = self.read_template("00_status.md")
        readme = self.read_template("README.md")

        self.assertIn("firefly_work_status_v4", status)
        self.assertIn("anchored_story_loop_v3", status)
        self.assertIn("surface_profile: plan_arc_manuscript_v1", status)
        self.assertIn("arc_pacing_profile: webnovel_1_to_3", status)
        self.assertIn("current_b_arc: B001", status)
        self.assertIn("arc_route_rail", status)
        self.assertIn("기획서 -> Arc -> 원고", readme)
        self.assertIn("내부 Story Plan 네 문서", readme)
        self.assertIn("A-Rail", readme)
        self.assertIn("B-Rail", readme)

    def test_blind_review_exposes_surface_drift_without_humanity_score(self) -> None:
        review = self.read_template("05_review/ep000_review.md")
        self.assertIn("first remembered sensory/object/action anchor", review)
        self.assertIn("independent response or changed behavior", review)
        self.assertIn("abstract procedural surface", review)
        self.assertNotIn("humanity score", review.lower())

    def test_template_uses_current_default_model_lanes(self) -> None:
        readme = self.read_template("README.md")
        context_contract = self.read_template("00_stage_context_contract.md")
        pitch = self.read_template("01_pitch/pitch.md")
        review_protocol = self.read_template("05_review/00_review_protocol.md")
        source_feed = self.read_template("00_source_feed_prompt.md")

        for surface in (readme, context_contract, pitch, review_protocol):
            self.assertIn("Web GPT Pro", surface)
            self.assertIn("gpt-5.6-terra", surface)

        self.assertIn("owner", context_contract)
        self.assertIn("최대 2개", context_contract)
        self.assertIn("Web Gemini", source_feed)
        self.assertIn("대체 생산 레인", source_feed)

    def test_template_runtime_material_dependencies_exist(self) -> None:
        required_paths = (
            "30_materials/source_maps/assembly_recipe_template.md",
            "30_materials/source_maps/character_court_template.md",
            "30_materials/source_maps/premise_transaction_template.md",
            "30_materials/source_maps/scene_forge_template.md",
            "30_materials/block/block_bank.md",
            "30_materials/character/character_bank.md",
            "30_materials/character/protagonist_operating_identity_template.md",
            "30_materials/comparisons/doksik_human_pitch_inferred.md",
            "30_materials/craft/craft_doctrine_inject.md",
            "30_materials/craft/genre_profiles/modern_fantasy.md",
            "30_materials/esm/esm_bank.md",
            "30_materials/presets/modern_fantasy_chaebol/greenfield_pitch_dispatch.md",
        )

        for relative_path in required_paths:
            self.assertTrue((ROOT / relative_path).is_file(), relative_path)

    def test_hukkum_intake_manifest_catalogs_authoritative_corpus_without_preassigning_a_role(self) -> None:
        manifest = (ROOT / "30_materials" / "source_maps" / "hukkum_intake_manifest.md").read_text(encoding="utf-8")
        self.assertIn("status: intake_pending", manifest)
        self.assertIn("흑곰작가", manifest)
        self.assertIn("티끌 모아 대박_흑곰작가_합본.txt", manifest)
        self.assertIn("검은 머리 미국 대재벌!_흑곰작가_합본.txt", manifest)
        self.assertIn("bundle_role: derive_from_source_feed", manifest)


if __name__ == "__main__":
    unittest.main()
