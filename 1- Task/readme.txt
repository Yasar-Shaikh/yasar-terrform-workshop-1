Homework 📝 – Workshop 3 Follow-up
1️⃣ Convert Storage Account → use count = 3 (create 3 SAs, each with its own random suffix)
2️⃣ Convert NSG rules (http + rdp) → combine into one block using for_each instead of two separate resources
3️⃣ Add lifecycle → ignore_changes = [tags] on all resources (so manual/policy-added tags don't get reverted on every plan)
4️⃣ Add lifecycle → prevent_destroy = true on the Storage Account, then run terraform destroy and screenshot the error it throws 📸
5️⃣ Run terraform state list at the end and screenshot the output too — should clearly show sa[0], sa[1], sa[2] and rule["http"], rule["rdp"]